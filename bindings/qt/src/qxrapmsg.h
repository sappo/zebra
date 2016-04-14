/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
#ifndef Q_XRAP_MSG_H
#define Q_XRAP_MSG_H

#include "qzebra.h"

class QT_ZEBRA_EXPORT QXrapMsg : public QObject
{
    Q_OBJECT
public:

    //  Copy-construct to return the proper wrapped c types
    QXrapMsg (xrap_msg_t *self, QObject *qObjParent = 0);

    //  Create a new xrap_msg
    explicit QXrapMsg (int id, QObject *qObjParent = 0);

    //  Destroy the xrap_msg
    ~QXrapMsg ();

    //  Parse a xrap_msg from zmsg_t. Returns a new object, or NULL if
    //  the message could not be parsed, or was NULL. Destroys msg and
    //  nullifies the msg reference.                                  
    static QXrapMsg * decode (QZmsg *msgP);

    //  Encode xrap_msg into zmsg and destroy it. Returns a newly created       
    //  object or NULL if error. Use when not in control of sending the message.
    static QZmsg * encode (QXrapMsg *xrapMsgP);

    //  Receive and parse a xrap_msg from the socket. Returns new object,
    //  or NULL if error. Will block if there's no message waiting.      
    static QXrapMsg * recv (void *input);

    //  Receive and parse a xrap_msg from the socket. Returns new object,         
    //  or NULL either if there was no input waiting, or the recv was interrupted.
    static QXrapMsg * recvNowait (void *input);

    //  Send the xrap_msg to the output, and destroy it
    int send (void *output);

    //  Send the xrap_msg to the output, and destroy it
    int sendAgain (void *output);

    //  Get the xrap_msg id and printable command
    int id ();

    //  
    void setId (int id);

    //  Get/set the parent field
    const QString parent ();

    //  
    void setParent (const QString &param);

    //  Get/set the content_type field
    const QString contentType ();

    //  
    void setContentType (const QString &param);

    //  Get/set the parent field
    const QString contentBody ();

    //  
    void setContentBody (const QString &param);

    //  Get/set the status_code field
    quint16 statusCode ();

    //  
    void setStatusCode (quint16 statusCode);

    //  Get/set the location field
    const QString location ();

    //  
    void setLocation (const QString &param);

    //  Get/set the etag field
    const QString etag ();

    //  
    void setEtag (const QString &param);

    //  Get/set the date_modified field
    quint64 dateModified ();

    //  
    void setDateModified (quint64 dateModified);

    //  Get/set the resource field
    const QString resource ();

    //  
    void setResource (const QString &param);

    //  //  Get/set the parameters field
    QZhash * parameters ();

    //  //  Get the parameters field and transfer ownership to caller
    QZhash * getParameters ();

    //  
    void setParameters (QZhash *parametersP);

    //  Get/set the parameters field
    const QString parametersString (const QString &key, const QString &defaultValue);

    //  
    void parametersInsert (const QString &key, const QString &param);

    //  Get/set the if_modified_since field
    quint64 ifModifiedSince ();

    //  
    void setIfModifiedSince (quint64 ifModifiedSince);

    //  Get/set the if_none_match field
    const QString ifNoneMatch ();

    //  
    void setIfNoneMatch (const QString &param);

    //  //  Get/set the metadata field
    QZhash * metadata ();

    //  //  Get the metadata field and transfer ownership to caller
    QZhash * getMetadata ();

    //  
    void setMetadata (QZhash *metadataP);

    //  Get/set a value in the metadata dictionary
    const QString metadataString (const QString &key, const QString &defaultValue);

    //  
    void metadataInsert (const QString &key, const QString &param);

    //  Get/set the if_unmodified_since field
    quint64 ifUnmodifiedSince ();

    //  
    void setIfUnmodifiedSince (quint64 ifUnmodifiedSince);

    //  Get/set the if_match field
    const QString ifMatch ();

    //  
    void setIfMatch (const QString &param);

    //  Get/set the status_text field
    const QString statusText ();

    //  
    void setStatusText (const QString &param);

    //  Self test of this class.
    static void test (bool verbose);

    xrap_msg_t *self;
};
#endif //  Q_XRAP_MSG_H
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
