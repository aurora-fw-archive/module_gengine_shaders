# ┌─┐┬ ┬┬─┐┌─┐┬─┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬┌─┐┬─┐┬┌─
# ├─┤│ │├┬┘│ │├┬┘├─┤  ├┤ ├┬┘├─┤│││├┤ ││││ │├┬┘├┴┐
# ┴ ┴└─┘┴└─└─┘┴└─┴ ┴  └  ┴└─┴ ┴┴ ┴└─┘└┴┘└─┘┴└─┴ ┴
# A Powerful General Purpose Framework
# More information in: https://aurora-fw.github.io/
#
# Copyright (C) 2017 Aurora Framework, All rights reserved.
#
# This file is part of the Aurora Framework. This framework is free
# software; you can redistribute it and/or modify it under the terms of
# the GNU Lesser General Public License version 3 as published by the
# Free Software Foundation and appearing in the file LICENSE included in
# the packaging of this file. Please review the following information to
# ensure the GNU Lesser General Public License version 3 requirements
# will be met: https://www.gnu.org/licenses/lgpl-3.0.html.

message(STATUS "Loading gengine-shaders module...")

if (NOT CONFIGURED_ONCE)
	set(AURORAFW_MODULE_GENGINE_SHADERS_SOURCE_DIR ${AURORAFW_MODULE_GENGINE_SHADERS_DIR}/src)
endif()

include_directories(${AURORAFW_MODULE_GENGINE_SHADERS_DIR}/include)
file(GLOB_RECURSE AURORAFW_MODULE_GENGINE_SHADERS_HEADERS ${AURORAFW_MODULE_GENGINE_SHADERS_DIR}/include/*.*)
file(GLOB AURORAFW_MODULE_GENGINE_SHADERS_SOURCE ${AURORAFW_MODULE_GENGINE_SHADERS_SOURCE_DIR}/*.*)

add_library (aurorafw-gengine-shaders SHARED ${AURORAFW_MODULE_GENGINE_SHADERS_SOURCE})
if(AURORAFW_PCH)
	add_precompiled_header(aurorafw-gengine-shaders "${AURORAFW_MODULE_GENGINE_SHADERS_HEADERS}")
endif()

target_link_libraries(aurorafw-gengine-shaders aurorafw-gengine-opengl)

install(TARGETS aurorafw-gengine-shaders DESTINATION lib)
