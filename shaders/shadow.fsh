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
#include "libs/compat.glsl"
#pragma optimize(on)

vec4 fromGamma(vec4 c) {
  return pow(c, vec4(2.2));
}

uniform sampler2D tex;

varying vec2 texcoord;
varying vec3 color;

varying vec4 ndata;

/* DRAWBUFFERS:01 */

void main() {
	gl_FragData[0] = mix(vec4(0.1), fromGamma(texture2D(tex, texcoord) * vec4(color, 1.0)), ndata.a);
	gl_FragData[1] = vec4(ndata.rgb, 1.0);
}
