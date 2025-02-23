-- Author: philh30
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local capabilities = require "st.capabilities"
local capdefs = require('capabilitydefs')

local TimeoutDuration = capabilities[capdefs.TimeoutDuration.name]
local OperationMode = capabilities[capdefs.OperationMode.name]
local LightSensing = capabilities[capdefs.LightSensing.name]
local MotionSensitivity = capabilities[capdefs.MotionSensitivity.name]

local handler = {}

function handler.timeoutDuration(device,config_value)
    local map = {
        [0] = "5s",
        [1] = "1m",
        [5] = "5m",
        [15] = "15m",
        [30] = "30m",
    }
    device:emit_event(TimeoutDuration.timeoutDuration({value = map[config_value]}))
end

function handler.operationMode(device,config_value)
    local map = {
        'manual',
        'vacancy',
        'occupancy',
    }
    device:emit_event(OperationMode.operationMode({value = map[config_value]}))
end

function handler.motionSensitivity(device,config_value)
    local map = {
        "high",
        "medium",
        "low"
    }
    device:emit_event(MotionSensitivity.motionSensitivity({value = map[config_value]}))
end

function handler.lightSensing(device,config_value)
    device:emit_event(LightSensing.lightSensing({value = (config_value == 0) and 'off' or 'on'}))
end

return handler