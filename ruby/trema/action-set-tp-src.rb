#
# Copyright (C) 2008-2012 NEC Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#


require "trema/action"
require "trema/monkey-patch/integer"


module Trema
  #
  # An action to modify the source TCP or UDP port of a packet.
  #
  class ActionSetTpSrc < Action
    attr_reader :port_number


    #
    # Creates an action to modify the source TCP or UDP port of a packet.
    #
    # @example
    #   ActionSetTpSrc.new( 5555 )
    #
    # @param [Integer] port_number
    #   the source TCP or UDP port number. Any numeric 16-bit value.
    #
    # @raise [ArgumentError] if port_number argument is not supplied.
    # @raise [ArgumentError] if port_number is not an unsigned 16-bit Integer.
    # @raise [TypeError] if port_number is not an Integer.
    #
    def initialize port_number
      if not port_number.is_a?( Integer )
        raise TypeError, "Source TCP or UDP port must be an unsigned 16-bit integer"
      end
      if not port_number.unsigned_16bit?
        raise ArgumentError, "Source TCP or UDP port must be an unsigned 16-bit integer"
      end
      @port_number = port_number
    end
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End: