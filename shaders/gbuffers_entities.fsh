/*
 * Copyright 2017 Cheng Cao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// =============================================================================
//  PLEASE FOLLOW THE LICENSE AND PLEASE DO NOT REMOVE THE LICENSE HEADER
// =============================================================================
//  ANY USE OF THE SHADER ONLINE OR OFFLINE IS CONSIDERED AS INCLUDING THE CODE
//  IF YOU DOWNLOAD THE SHADER, IT MEANS YOU AGREE AND OBSERVE THIS LICENSE
// =============================================================================

#version 120

//#include "libs/compat.glsl"

#pragma optimize(on)

uniform sampler2D texture;

varying vec4 color;
varying vec2 normal;
varying vec4 coords;

#define texcoord coords.rg
#define lmcoord coords.ba

#include "libs/encoding.glsl"

uniform vec4 entityColor;

/* DRAWBUFFERS:0124 */
void main() {
	vec4 texcolor = texture2D(texture, texcoord);
	gl_FragData[0] = (texcolor + entityColor * texcolor.a) * color;
	gl_FragData[1] = vec4(0.02, 0.01, 0.0, 1.0);
	gl_FragData[2] = vec4(normal, lmcoord);
	gl_FragData[3] = vec4(normal, entityFlag, 1.0);
}
