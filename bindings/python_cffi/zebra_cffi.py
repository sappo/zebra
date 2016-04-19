################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

from __future__ import print_function
import os
import re
import sys

from pyczmq._cffi import ffi

try:
    # If LD_LIBRARY_PATH or your OSs equivalent is set, this is the only way to
    # load the library.  If we use find_library below, we get the wrong result.
    if os.name == 'posix':
        if sys.platform == 'darwin':
            libpath = 'libzebra.0.dylib'
        else:
            libpath = 'libzebra.so.0'
    elif os.name == 'nt':
        libpath = 'libzebra.dll'
    lib = ffi.dlopen(libpath)
except OSError:
    libpath = find_library("zebra")
    if not libpath:
        raise ImportError("Unable to find libzebra")
    lib = ffi.dlopen(libpath)

# Custom setup for zebra


cdefs = '''
typedef struct _zeb_client_t zeb_client_t;
typedef struct _zactor_t zactor_t;
typedef struct _zsock_t zsock_t;
typedef struct _zmsg_t zmsg_t;
typedef struct _zuuid_t zuuid_t;
typedef struct _zeb_handler_t zeb_handler_t;
typedef struct _xrap_msg_t xrap_msg_t;
typedef struct _zhash_t zhash_t;
typedef struct _xrap_traffic_t xrap_traffic_t;
typedef struct _zframe_t zframe_t;
// CLASS: zeb_client
// Create a new zeb_client, return the reference if successful,   
// or NULL if construction failed due to lack of available memory.
zeb_client_t *
    zeb_client_new (void);

// Destroy the zeb_client and free all memory used by the object.
void
    zeb_client_destroy (zeb_client_t **self_p);

// Return actor, when caller wants to work with multiple actors and/or
// input sockets asynchronously.                                      
zactor_t *
    zeb_client_actor (zeb_client_t *self);

// Return message pipe for asynchronous message I/O. In the high-volume case,
// we send methods and get replies to the actor, in a synchronous manner, and
// we send/recv high volume message data to a second pipe, the msgpipe. In   
// the low-volume case we can do everything over the actor pipe, if traffic  
// is never ambiguous.                                                       
zsock_t *
    zeb_client_msgpipe (zeb_client_t *self);

// Return true if client is currently connected, else false. Note that the   
// client will automatically re-connect if the server dies and restarts after
// a successful first connection.                                            
bool
    zeb_client_connected (zeb_client_t *self);

// Connect to server endpoint, with specified timeout in msecs (zero means wait    
// forever). Constructor succeeds if connection is successful. The caller may      
// specify its address.                                                            
// Returns >= 0 if successful, -1 if interrupted.                                  
int
    zeb_client_connect (zeb_client_t *self, const char *endpoint, uint32_t timeout, const char *address);

// Offer to handle particular XRAP requests, where the route matches request's     
// resource.                                                                       
// Returns >= 0 if successful, -1 if interrupted.                                  
int
    zeb_client_set_handler (zeb_client_t *self, const char *method, const char *route);

// No explanation                                                                  
// Returns >= 0 if successful, -1 if interrupted.                                  
int
    zeb_client_request (zeb_client_t *self, uint32_t timeout, zmsg_t **content);

// Send XRAP DELIVER message to server, takes ownership of message
// and destroys message when done sending it.                     
int
    zeb_client_deliver (zeb_client_t *self, zuuid_t *sender, zmsg_t **content);

// Receive message from server; caller destroys message when done
zmsg_t *
    zeb_client_recv (zeb_client_t *self);

// Return last received command. Can be one of these values:
//     "XRAP DELIVER"                                       
const char *
    zeb_client_command (zeb_client_t *self);

// Return last received status
int
    zeb_client_status (zeb_client_t *self);

// Return last received reason
const char *
    zeb_client_reason (zeb_client_t *self);

// Return last received sender
zuuid_t *
    zeb_client_sender (zeb_client_t *self);

// Return last received content
zmsg_t *
    zeb_client_content (zeb_client_t *self);

// Enable verbose tracing (animation) of state machine activity.
void
    zeb_client_set_verbose (zeb_client_t *self, bool verbose);

// Self test of this class.
void
    zeb_client_test (bool verbose);

// CLASS: zeb_handler
// To work with zeb_handler, use the CZMQ zactor API:                      
//                                                                         
// Create new zeb_handler instance, passing the broker endpoint:           
//                                                                         
//     zactor_t *handler = zactor_new (zeb_handler, "inproc://broker");    
//                                                                         
// Destroy zeb_handler instance                                            
//                                                                         
//     zactor_destroy (&handler);                                          
//                                                                         
// Enable verbose logging of commands and activity:                        
//                                                                         
//     zstr_send (handler, "VERBOSE");                                     
//                                                                         
// Receive API calls from zeb_handler:                                     
//                                                                         
//     char *command = zstr_recv (handler);                                
//                                                                         
// Check if an etag is current, MUST signal 0 if true otherwise 1.         
//                                                                         
//   if (streq (command, "CHECK ETAG")) {                                  
//      char *etag = zstr_recv (handler);                                  
//      zsock_signal (handler, 0);                                         
//   }                                                                     
//                                                                         
// Check if a last modified timestamp is current, MUST signal 0 if true    
// otherwise 1.                                                            
//                                                                         
//   if (streq (command, "CHECK LAST MODIFIED")) {                         
//      uint64_t last_modified;                                            
//      zsock_brecv (handler, "8", &last_modified);                        
//      zsock_signal (handler, 0);                                         
//   }                                                                     
//                                                                         
// Handle incomming request from clients. MUST return a response.          
//                                                                         
// if (streq (command, "HANDLE REQUEST")) {                                
//     zmsg_t *request = zmsg_recv (handle);                               
//     xrap_msg_t *xrequest = xrap_msg_decode (&request);                  
//     zmsg_t *response = xrap_msg_encode (&xrequest);                     
//     zmsg_send (&response, handler);                                     
// }                                                                       
//                                                                         
// This is the handler actor which runs in its own thread and polls its two
// sockets to process incoming messages.                                   
ZEBRA_EXPORT void
   zeb_handler (zsock_t *pipe, void *args);

// Add a new offer this handler will handle. Returns 0 if successful,
// otherwise -1.                                                     
// The content type parameter is optional and is used to             
// filter requests upon their requested (GET) or provided (POST/PUT) 
// content's type. The content type parameter may be a regex. If the 
// request's content type does not match it is automatically rejected
// with the error code 406 (Not acceptable).                         
int
    zeb_handler_add_offer (zactor_t *self, int method, const char *uri, const char *content_type);

// Self test of this class.
void
    zeb_handler_test (bool verbose);

// CLASS: xrap msg
// Create a new xrap_msg
xrap_msg_t *
    xrap_msg_new (int id);

// Destroy the xrap_msg
void
    xrap_msg_destroy (xrap_msg_t **self_p);

// Parse a xrap_msg from zmsg_t. Returns a new object, or NULL if
// the message could not be parsed, or was NULL. Destroys msg and
// nullifies the msg reference.                                  
xrap_msg_t *
    xrap_msg_decode (zmsg_t **msg_p);

// Encode xrap_msg into zmsg and destroy it. Returns a newly created       
// object or NULL if error. Use when not in control of sending the message.
zmsg_t *
    xrap_msg_encode (xrap_msg_t **xrap_msg_p);

// Receive and parse a xrap_msg from the socket. Returns new object,
// or NULL if error. Will block if there's no message waiting.      
xrap_msg_t *
    xrap_msg_recv (void *input);

// Receive and parse a xrap_msg from the socket. Returns new object,         
// or NULL either if there was no input waiting, or the recv was interrupted.
xrap_msg_t *
    xrap_msg_recv_nowait (void *input);

// Send the xrap_msg to the output, and destroy it
int
    xrap_msg_send (xrap_msg_t **self_p, void *output);

// Send the xrap_msg to the output, and destroy it
int
    xrap_msg_send_again (xrap_msg_t *self, void *output);

// Get the xrap_msg id and printable command
int
    xrap_msg_id (xrap_msg_t *self);

// 
void
    xrap_msg_set_id (xrap_msg_t *self, int id);

// Get/set the parent field
const char *
    xrap_msg_parent (xrap_msg_t *self);

// 
void
    xrap_msg_set_parent (xrap_msg_t *self, const char *format, ...);

// Get/set the content_type field
const char *
    xrap_msg_content_type (xrap_msg_t *self);

// 
void
    xrap_msg_set_content_type (xrap_msg_t *self, const char *format, ...);

// Get/set the parent field
const char *
    xrap_msg_content_body (xrap_msg_t *self);

// 
void
    xrap_msg_set_content_body (xrap_msg_t *self, const char *format, ...);

// Get/set the status_code field
uint16_t
    xrap_msg_status_code (xrap_msg_t *self);

// 
void
    xrap_msg_set_status_code (xrap_msg_t *self, uint16_t status_code);

// Get/set the location field
const char *
    xrap_msg_location (xrap_msg_t *self);

// 
void
    xrap_msg_set_location (xrap_msg_t *self, const char *format, ...);

// Get/set the etag field
const char *
    xrap_msg_etag (xrap_msg_t *self);

// 
void
    xrap_msg_set_etag (xrap_msg_t *self, const char *format, ...);

// Get/set the date_modified field
uint64_t
    xrap_msg_date_modified (xrap_msg_t *self);

// 
void
    xrap_msg_set_date_modified (xrap_msg_t *self, uint64_t date_modified);

// Get/set the resource field
const char *
    xrap_msg_resource (xrap_msg_t *self);

// 
void
    xrap_msg_set_resource (xrap_msg_t *self, const char *format, ...);

// //  Get/set the parameters field
zhash_t *
    xrap_msg_parameters (xrap_msg_t *self);

// //  Get the parameters field and transfer ownership to caller
zhash_t *
    xrap_msg_get_parameters (xrap_msg_t *self);

// 
void
    xrap_msg_set_parameters (xrap_msg_t *self, zhash_t **parameters_p);

// Get/set the parameters field
const char *
    xrap_msg_parameters_string (xrap_msg_t *self, const char *key, const char *default_value);

// 
void
    xrap_msg_parameters_insert (xrap_msg_t *self, const char *key, const char *format, ...);

// Get/set the if_modified_since field
uint64_t
    xrap_msg_if_modified_since (xrap_msg_t *self);

// 
void
    xrap_msg_set_if_modified_since (xrap_msg_t *self, uint64_t if_modified_since);

// Get/set the if_none_match field
const char *
    xrap_msg_if_none_match (xrap_msg_t *self);

// 
void
    xrap_msg_set_if_none_match (xrap_msg_t *self, const char *format, ...);

// //  Get/set the metadata field
zhash_t *
    xrap_msg_metadata (xrap_msg_t *self);

// //  Get the metadata field and transfer ownership to caller
zhash_t *
    xrap_msg_get_metadata (xrap_msg_t *self);

// 
void
    xrap_msg_set_metadata (xrap_msg_t *self, zhash_t **metadata_p);

// Get/set a value in the metadata dictionary
const char *
    xrap_msg_metadata_string (xrap_msg_t *self, const char *key, const char *default_value);

// 
void
    xrap_msg_metadata_insert (xrap_msg_t *self, const char *key, const char *format, ...);

// Get/set the if_unmodified_since field
uint64_t
    xrap_msg_if_unmodified_since (xrap_msg_t *self);

// 
void
    xrap_msg_set_if_unmodified_since (xrap_msg_t *self, uint64_t if_unmodified_since);

// Get/set the if_match field
const char *
    xrap_msg_if_match (xrap_msg_t *self);

// 
void
    xrap_msg_set_if_match (xrap_msg_t *self, const char *format, ...);

// Get/set the status_text field
const char *
    xrap_msg_status_text (xrap_msg_t *self);

// 
void
    xrap_msg_set_status_text (xrap_msg_t *self, const char *format, ...);

// Self test of this class.
void
    xrap_msg_test (bool verbose);

// CLASS: xrap_traffic
// Create a new empty xrap_traffic
xrap_traffic_t *
    xrap_traffic_new (void);

// Destroy a xrap_traffic instance
void
    xrap_traffic_destroy (xrap_traffic_t **self_p);

// Receive a xrap_traffic from the socket. Returns 0 if OK, -1 if
// there was an error. Blocks if there is no message waiting.    
int
    xrap_traffic_recv (xrap_traffic_t *self, zsock_t *input);

// Send the xrap_traffic to the output socket, does not destroy it
int
    xrap_traffic_send (xrap_traffic_t *self, zsock_t *output);

// Print contents of message to stdout
void
    xrap_traffic_print (xrap_traffic_t *self);

// Get the message routing id, as a frame
zframe_t *
    xrap_traffic_routing_id (xrap_traffic_t *self);

// Set the message routing id from a frame
void
    xrap_traffic_set_routing_id (xrap_traffic_t *self, zframe_t *routing_id);

// Get the xrap_traffic message id
int
    xrap_traffic_id (xrap_traffic_t *self);

// Set the xrap_traffic message id
void
    xrap_traffic_set_id (xrap_traffic_t *self, int id);

// Get the xrap_traffic message id as printable text
const char *
    xrap_traffic_command (xrap_traffic_t *self);

// Get the address field
const char *
    xrap_traffic_address (xrap_traffic_t *self);

// Set the address field
void
    xrap_traffic_set_address (xrap_traffic_t *self, const char *address);

// Get the timeout field
uint32_t
    xrap_traffic_timeout (xrap_traffic_t *self);

// Set the timeout field
void
    xrap_traffic_set_timeout (xrap_traffic_t *self, uint32_t timeout);

// Get a copy of the content field
zmsg_t *
    xrap_traffic_content (xrap_traffic_t *self);

// Get the content field and transfer ownership to caller
zmsg_t *
    xrap_traffic_get_content (xrap_traffic_t *self);

// 
void
    xrap_traffic_set_content (xrap_traffic_t *self, zmsg_t **content_p);

// Get the route field
const char *
    xrap_traffic_route (xrap_traffic_t *self);

// Set the route field
void
    xrap_traffic_set_route (xrap_traffic_t *self, const char *route);

// Get the method field
const char *
    xrap_traffic_method (xrap_traffic_t *self);

// Set the method field
void
    xrap_traffic_set_method (xrap_traffic_t *self, const char *method);

// Get the sender field
zuuid_t *
    xrap_traffic_sender (xrap_traffic_t *self);

// Get the sender field and transfer ownership to caller
zuuid_t *
    xrap_traffic_get_sender (xrap_traffic_t *self);

// Set the sender field
void
    xrap_traffic_set_sender (xrap_traffic_t *self, zuuid_t *sender_p);

// Get the status_code field
uint16_t
    xrap_traffic_status_code (xrap_traffic_t *self);

// Set the status_code field
void
    xrap_traffic_set_status_code (xrap_traffic_t *self, uint16_t status_code);

// Get the status_reason field
const char *
    xrap_traffic_status_reason (xrap_traffic_t *self);

// Set the status_reason field
void
    xrap_traffic_set_status_reason (xrap_traffic_t *self, const char *status_reason);

// Self test of this class.
void
    xrap_traffic_test (bool verbose);

'''
cdefs = re.sub(r';[^;]*\bva_list\b[^;]*;', ';', cdefs, flags=re.S) # we don't support anything with a va_list arg

ffi.cdef(cdefs)
