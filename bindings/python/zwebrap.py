################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

from __future__ import print_function
import os, sys
from ctypes import *
from ctypes.util import find_library

# zwebrap
try:
    # If LD_LIBRARY_PATH or your OSs equivalent is set, this is the only way to
    # load the library.  If we use find_library below, we get the wrong result.
    if os.name == 'posix':
        if sys.platform == 'darwin':
            lib = cdll.LoadLibrary('libzwebrap.0.dylib')
        else:
            lib = cdll.LoadLibrary("libzwebrap.so.0")
    elif os.name == 'nt':
        lib = cdll.LoadLibrary('libzwebrap.dll')
except OSError:
    libpath = find_library("zwebrap")
    if not libpath:
        raise ImportError("Unable to find libzwebrap")
    lib = cdll.LoadLibrary(libpath)

class zwr_client_t(Structure):
    pass # Empty - only for type checking
zwr_client_p = POINTER(zwr_client_t)

class zactor_t(Structure):
    pass # Empty - only for type checking
zactor_p = POINTER(zactor_t)

class zsock_t(Structure):
    pass # Empty - only for type checking
zsock_p = POINTER(zsock_t)

class number_t(Structure):
    pass # Empty - only for type checking
number_p = POINTER(number_t)

class zmsg_t(Structure):
    pass # Empty - only for type checking
zmsg_p = POINTER(zmsg_t)

class zuuid_t(Structure):
    pass # Empty - only for type checking
zuuid_p = POINTER(zuuid_t)


# zwr_client
lib.zwr_client_new.restype = zwr_client_p
lib.zwr_client_new.argtypes = []
lib.zwr_client_destroy.restype = None
lib.zwr_client_destroy.argtypes = [POINTER(zwr_client_p)]
lib.zwr_client_print.restype = None
lib.zwr_client_print.argtypes = [zwr_client_p]
lib.zwr_client_actor.restype = zactor_p
lib.zwr_client_actor.argtypes = [zwr_client_p]
lib.zwr_client_msgpipe.restype = zsock_p
lib.zwr_client_msgpipe.argtypes = [zwr_client_p]
lib.zwr_client_connected.restype = c_bool
lib.zwr_client_connected.argtypes = [zwr_client_p]
lib.zwr_client_connect.restype = c_int
lib.zwr_client_connect.argtypes = [zwr_client_p, c_char_p, number_p, c_char_p]
lib.zwr_client_set_handler.restype = c_int
lib.zwr_client_set_handler.argtypes = [zwr_client_p, c_char_p, c_char_p]
lib.zwr_client_request.restype = c_int
lib.zwr_client_request.argtypes = [zwr_client_p, number_p, POINTER(zmsg_p)]
lib.zwr_client_deliver.restype = c_int
lib.zwr_client_deliver.argtypes = [zwr_client_p, zuuid_p, POINTER(zmsg_p)]
lib.zwr_client_recv.restype = zmsg_p
lib.zwr_client_recv.argtypes = [zwr_client_p]
lib.zwr_client_command.restype = c_char_p
lib.zwr_client_command.argtypes = [zwr_client_p]
lib.zwr_client_status.restype = c_int
lib.zwr_client_status.argtypes = [zwr_client_p]
lib.zwr_client_reason.restype = c_char_p
lib.zwr_client_reason.argtypes = [zwr_client_p]
lib.zwr_client_sender.restype = zuuid_p
lib.zwr_client_sender.argtypes = [zwr_client_p]
lib.zwr_client_content.restype = zmsg_p
lib.zwr_client_content.argtypes = [zwr_client_p]
lib.zwr_client_test.restype = None
lib.zwr_client_test.argtypes = [c_bool]

class ZwrClient(object):
    """ZWebRap Client"""

    def __init__(self, *args):
        """Create a new zwr_client, return the reference if successful, or NULL
if construction failed due to lack of available memory."""
        if len(args) == 2 and type(args[0]) is c_void_p and isinstance(args[1], bool):
            self._as_parameter_ = cast(args[0], zwr_client_p) # Conversion from raw type to binding
            self.allow_destruct = args[1] # This is a 'fresh' value, owned by us
        elif len(args) == 2 and type(args[0]) is zwr_client_p and isinstance(args[1], bool):
            self._as_parameter_ = args[0] # Conversion from raw type to binding
            self.allow_destruct = args[1] # This is a 'fresh' value, owned by us
        else:
            assert(len(args) == 0)
            self._as_parameter_ = lib.zwr_client_new() # Creation of new raw type
            self.allow_destruct = True

    def __del__(self):
        """Destroy the zwr_client and free all memory used by the object."""
        if self.allow_destruct:
            lib.zwr_client_destroy(byref(self._as_parameter_))

    def __bool__(self):
        "Determine whether the object is valid by converting to boolean" # Python 3
        return self._as_parameter_.__bool__()

    def __nonzero__(self):
        "Determine whether the object is valid by converting to boolean" # Python 2
        return self._as_parameter_.__nonzero__()

    def print(self):
        """Print properties of the zwr_client object."""
        return lib.zwr_client_print(self._as_parameter_)

    def actor(self):
        """Return actor, when caller wants to work with multiple actors and/or
input sockets asynchronously."""
        return lib.zwr_client_actor(self._as_parameter_)

    def msgpipe(self):
        """Return message pipe for asynchronous message I/O. In the high-volume case,
we send methods and get replies to the actor, in a synchronous manner, and
we send/recv high volume message data to a second pipe, the msgpipe. In
the low-volume case we can do everything over the actor pipe, if traffic
is never ambiguous."""
        return lib.zwr_client_msgpipe(self._as_parameter_)

    def connected(self):
        """Return true if client is currently connected, else false. Note that the
client will automatically re-connect if the server dies and restarts after
a successful first connection."""
        return lib.zwr_client_connected(self._as_parameter_)

    def connect(self, endpoint, timeout, address):
        """Connect to server endpoint, with specified timeout in msecs (zero means wait
forever). Constructor succeeds if connection is successful. The caller may
specify its address.
Returns >= 0 if successful, -1 if interrupted."""
        return lib.zwr_client_connect(self._as_parameter_, endpoint, timeout, address)

    def set_handler(self, method, route):
        """Offer to handle particular XRAP requests, where the route matches request's
resource.
Returns >= 0 if successful, -1 if interrupted."""
        return lib.zwr_client_set_handler(self._as_parameter_, method, route)

    def request(self, timeout, content_p):
        """No explanation
Returns >= 0 if successful, -1 if interrupted."""
        return lib.zwr_client_request(self._as_parameter_, timeout, byref(zmsg_p.from_param(content_p)))

    def deliver(self, sender, content_p):
        """Send XRAP DELIVER message to server, takes ownership of message
and destroys message when done sending it."""
        return lib.zwr_client_deliver(self._as_parameter_, sender, byref(zmsg_p.from_param(content_p)))

    def recv(self):
        """Receive message from server; caller destroys message when done"""
        return lib.zwr_client_recv(self._as_parameter_)

    def command(self):
        """Return last received command. Can be one of these values:
    "XRAP DELIVER""""
        return lib.zwr_client_command(self._as_parameter_)

    def status(self):
        """Return last received status"""
        return lib.zwr_client_status(self._as_parameter_)

    def reason(self):
        """Return last received reason"""
        return lib.zwr_client_reason(self._as_parameter_)

    def sender(self):
        """Return last received sender"""
        return lib.zwr_client_sender(self._as_parameter_)

    def content(self):
        """Return last received content"""
        return lib.zwr_client_content(self._as_parameter_)

    @staticmethod
    def test(verbose):
        """Self test of this class."""
        return lib.zwr_client_test(verbose)

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################