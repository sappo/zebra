/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/

#include "qzebra.h"

///
//  Copy-construct to return the proper wrapped c types
QZuuid::QZuuid (zuuid_t *self, QObject *qObjParent) : QObject (qObjParent)
{
    this->self = self;
}


///
//  Create a new UUID object.
QZuuid::QZuuid (QObject *qObjParent) : QObject (qObjParent)
{
    this->self = zuuid_new ();
}

///
//  Create UUID object from supplied ZUUID_LEN-octet value.
QZuuid* QZuuid::newFrom (const byte *source, QObject *qObjParent)
{
    return new QZuuid (zuuid_new_from (source), qObjParent);
}

///
//  Destroy a specified UUID object.
QZuuid::~QZuuid ()
{
    zuuid_destroy (&self);
}

///
//  Set UUID to new supplied ZUUID_LEN-octet value.
void QZuuid::set (const byte *source)
{
    zuuid_set (self, source);
    
}

///
//  Set UUID to new supplied string value skipping '-' and '{' '}'
//  optional delimiters. Return 0 if OK, else returns -1.         
int QZuuid::setStr (const QString &source)
{
    int rv = zuuid_set_str (self, source.toUtf8().data());
    return rv;
}

///
//  Return UUID binary data.
const byte * QZuuid::data ()
{
    const byte * rv = zuuid_data (self);
    return rv;
}

///
//  Return UUID binary size
size_t QZuuid::size ()
{
    size_t rv = zuuid_size (self);
    return rv;
}

///
//  Returns UUID as string
const QString QZuuid::str ()
{
    const QString rv = QString (zuuid_str (self));
    return rv;
}

///
//  Return UUID in the canonical string format: 8-4-4-4-12, in lower
//  case. Caller does not modify or free returned value. See        
//  http://en.wikipedia.org/wiki/Universally_unique_identifier      
const QString QZuuid::strCanonical ()
{
    const QString rv = QString (zuuid_str_canonical (self));
    return rv;
}

///
//  Store UUID blob in target array
void QZuuid::exportNoConflict (byte *target)
{
    zuuid_export (self, target);
    
}

///
//  Check if UUID is same as supplied value
bool QZuuid::eq (const byte *compare)
{
    bool rv = zuuid_eq (self, compare);
    return rv;
}

///
//  Check if UUID is different from supplied value
bool QZuuid::neq (const byte *compare)
{
    bool rv = zuuid_neq (self, compare);
    return rv;
}

///
//  Make copy of UUID object; if uuid is null, or memory was exhausted,
//  returns null.                                                      
QZuuid * QZuuid::dup ()
{
    QZuuid *rv = new QZuuid (zuuid_dup (self));
    return rv;
}

///
//  Self test of this class.
void QZuuid::test (bool verbose)
{
    zuuid_test (verbose);
    
}
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/
