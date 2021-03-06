##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetPort" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "NetPort server - used by several routers."

# ShodanHQ results as at 2011-05-30 #
# 83,817 for NetPort

# Examples #
examples %w|
201.10.105.227
46.19.16.54
62.41.54.81
162.127.230.82
205.119.127.245
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^NetPort Software ([^\s]+)$/) } if @headers["server"] =~ /^NetPort Software ([^\s]+)$/

	# Netport HTTP Header # Netport: Power by NetPort
	m << { :name=>"Netport HTTP Header" } if @headers["netport"] =~ /^Power by NetPort$/

	# Return passive matches
	m
end

end

