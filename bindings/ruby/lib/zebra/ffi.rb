################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

require 'ffi'
require_relative 'ffi/version'

module Zebra
  module FFI
    module LibC
      extend ::FFI::Library
      ffi_lib ::FFI::Platform::LIBC
      attach_function :free, [ :pointer ], :void, blocking: true
    end

    extend ::FFI::Library

    def self.available?
      @available
    end

    begin
      lib_name = 'libzebra'
      lib_paths = ['/usr/local/lib', '/opt/local/lib', '/usr/lib64']
        .map { |path| "#{path}/#{lib_name}.#{::FFI::Platform::LIBSUFFIX}" }
      ffi_lib lib_paths + [lib_name]
      @available = true
    rescue LoadError
      warn ""
      warn "WARNING: ::Zebra::FFI is not available without libzebra."
      warn ""
      @available = false
    end

    if available?
      opts = {
        blocking: true  # only necessary on MRI to deal with the GIL.
      }

      begin # DRAFT method
        attach_function :xrap_msg_new, [:int], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_new() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_destroy, [:pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_destroy() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_decode, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_decode() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_encode, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_encode() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_recv, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_recv() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_recv_nowait, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_recv_nowait() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_send, [:pointer, :pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_send() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_send_again, [:pointer, :pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_send_again() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_id, [:pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_id() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_id, [:pointer, :int], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_id() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_parent, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_parent() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_parent, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_parent() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_content_type, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_content_type() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_content_type, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_content_type() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_content_body, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_content_body() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_content_body, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_content_body() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_status_code, [:pointer], :uint16, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_status_code() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_status_code, [:pointer, :uint16], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_status_code() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_location, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_location() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_location, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_location() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_etag, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_etag() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_etag, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_etag() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_date_modified, [:pointer], :uint64, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_date_modified() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_date_modified, [:pointer, :uint64], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_date_modified() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_resource, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_resource() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_resource, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_resource() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_parameters, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_parameters() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_get_parameters, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_get_parameters() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_parameters, [:pointer, :pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_parameters() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_parameters_string, [:pointer, :string, :string], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_parameters_string() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_parameters_insert, [:pointer, :string, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_parameters_insert() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_if_modified_since, [:pointer], :uint64, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_if_modified_since() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_if_modified_since, [:pointer, :uint64], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_if_modified_since() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_if_none_match, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_if_none_match() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_if_none_match, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_if_none_match() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_metadata, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_metadata() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_get_metadata, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_get_metadata() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_metadata, [:pointer, :pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_metadata() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_metadata_string, [:pointer, :string, :string], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_metadata_string() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_metadata_insert, [:pointer, :string, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_metadata_insert() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_if_unmodified_since, [:pointer], :uint64, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_if_unmodified_since() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_if_unmodified_since, [:pointer, :uint64], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_if_unmodified_since() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_if_match, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_if_match() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_if_match, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_if_match() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_status_text, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_status_text() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_set_status_text, [:pointer, :string, :varargs], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_set_status_text() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_msg_test, [:bool], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_msg_test() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end

      require_relative 'ffi/xrap_msg'

      begin # DRAFT method
        attach_function :zeb_handler_add_offer, [:pointer, :int, :string], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_handler_add_offer() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_handler_add_accept, [:pointer, :string], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_handler_add_accept() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_handler_test, [:bool], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_handler_test() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end

      require_relative 'ffi/zeb_handler'

      begin # DRAFT method
        attach_function :xrap_traffic_new, [], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_new() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_destroy, [:pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_destroy() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_recv, [:pointer, :pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_recv() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_send, [:pointer, :pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_send() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_print, [:pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_print() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_routing_id, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_routing_id() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_routing_id, [:pointer, :pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_routing_id() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_id, [:pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_id() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_id, [:pointer, :int], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_id() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_command, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_command() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_address, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_address() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_address, [:pointer, :string], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_address() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_timeout, [:pointer], :uint32, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_timeout() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_timeout, [:pointer, :uint32], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_timeout() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_content, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_content() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_get_content, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_get_content() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_content, [:pointer, :pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_content() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_route, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_route() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_route, [:pointer, :string], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_route() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_method, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_method() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_method, [:pointer, :string], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_method() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_sender, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_sender() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_get_sender, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_get_sender() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_sender, [:pointer, :pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_sender() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_status_code, [:pointer], :uint16, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_status_code() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_status_code, [:pointer, :uint16], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_status_code() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_status_reason, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_status_reason() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_set_status_reason, [:pointer, :string], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_set_status_reason() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :xrap_traffic_test, [:bool], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function xrap_traffic_test() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end

      require_relative 'ffi/xrap_traffic'

      begin # DRAFT method
        attach_function :zeb_client_new, [], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_new() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_destroy, [:pointer], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_destroy() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_actor, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_actor() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_msgpipe, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_msgpipe() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_connected, [:pointer], :bool, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_connected() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_connect, [:pointer, :string, :uint32, :string], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_connect() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_set_handler, [:pointer, :string, :string], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_set_handler() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_request, [:pointer, :uint32, :pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_request() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_deliver, [:pointer, :pointer, :pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_deliver() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_recv, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_recv() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_command, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_command() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_status, [:pointer], :int, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_status() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_reason, [:pointer], :string, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_reason() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_sender, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_sender() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_content, [:pointer], :pointer, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_content() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_set_verbose, [:pointer, :bool], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_set_verbose() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end
      begin # DRAFT method
        attach_function :zeb_client_test, [:bool], :void, **opts
      rescue ::FFI::NotFoundError
        if $VERBOSE || $DEBUG
          warn "The function zeb_client_test() can't be used through " +
               "this Ruby binding because it's not available."
        end
      end

      require_relative 'ffi/zeb_client'
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
