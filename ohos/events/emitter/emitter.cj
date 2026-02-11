/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.events.emitter

import ohos.callback_invoke.{CallbackObject, Callback1Argument, CallbackList}
import ohos.ffi.Callback2Param
import ohos.labels.APILevel
import ohos.hilog.HilogChannel
import std.collection.{HashMap, ArrayList}
import std.sync.Mutex

let CONTROLLER_FOR_STRING_EVENT = HashMap<String, CallbackList>()
let CONTROLLER_FOR_U32_EVENT = HashMap<UInt32, CallbackList>()
let MUTEX_FOR_STRING_EVENT = Mutex()
let MUTEX_FOR_U32_EVENT = Mutex()
let EMITTER_LOG = HilogChannel(0, 0xD001201, "CJ-Emitter")

/**
 * Subscribes to a certain event in persistent manner and receives the event callback.
 *
 * @param { InnerEvent } event - Event to subscribe to in persistent manner. The EventPriority parameter is not required
 * and does not take effect.
 * @param { Callback1Argument<EventData> } callback - Callback to be executed when the event is received.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func on(event: InnerEvent, callback: Callback1Argument<EventData>): Unit {
    let eventId = event.eventId
    synchronized(MUTEX_FOR_U32_EVENT) {
        let callbackList = match (CONTROLLER_FOR_U32_EVENT.get(eventId)) {
            case Some(v) => v
            case None =>
                let list = CallbackList()
                CONTROLLER_FOR_U32_EVENT.add(eventId, list)
                list
        }
        callbackList.addCallback(
            callback,
            onInitialize: { =>
                let lambdaID = getLambdaIdByU32Id()
                unsafe { FfiOHOSEmitterOnU32Event(lambdaID) }
            },
            onFailed: { =>
                EMITTER_LOG.warn("The callback has been registered.")
            }
        )
    }
}

/**
 * Subscribes to a certain event in persistent manner and receives the event callback.
 *
 * @param { String } eventId - Event to subscribe to in persistent manner. The value cannot be an empty string and
 * exceed 10240 bytes.
 * @param { Callback1Argument<EventData> } callback - Callback to be executed when the event is received.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func on(eventId: String, callback: Callback1Argument<EventData>): Unit {
    synchronized(MUTEX_FOR_STRING_EVENT) {
        let callbackList = match (CONTROLLER_FOR_STRING_EVENT.get(eventId)) {
            case Some(v) => v
            case None =>
                let list = CallbackList()
                CONTROLLER_FOR_STRING_EVENT.add(eventId, list)
                list
        }
        callbackList.addCallback(
            callback,
            onInitialize: { =>
                let lambdaID = getLambdaIdByStringId()
                unsafe { FfiOHOSEmitterOnStringEvent(lambdaID) }
            },
            onFailed: { =>
                EMITTER_LOG.warn("The callback has been registered.")
            }
        )
    }
}

/**
 * Subscribes to an event in one-shot manner and unsubscribes from it after the event callback is recieved.
 *
 * @param { InnerEvent } event - Event to subscribe to in one-shot manner. The EventPriority settings do not take effect.
 * @param { Callback1Argument<EventData> } callback - Callback to be executed when the event is received.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func once(event: InnerEvent, callback: Callback1Argument<EventData>): Unit {
    let eventId = event.eventId
    synchronized(MUTEX_FOR_U32_EVENT) {
        let callbackList = match (CONTROLLER_FOR_U32_EVENT.get(eventId)) {
            case Some(v) => v
            case None =>
                let list = CallbackList()
                CONTROLLER_FOR_U32_EVENT.add(eventId, list)
                list
        }
        callbackList.addCallback(
            callback,
            isOnce: true,
            onInitialize: { =>
                let lambdaID = getLambdaIdByU32Id()
                unsafe { FfiOHOSEmitterOnU32Event(lambdaID) }
            },
            onFailed: { =>
                EMITTER_LOG.warn("The callback has been registered.")
            }
        )
    }
}

/**
 * Subscribes to an event in one-shot manner and unsubscribes from it after the event callback is recieved.
 *
 * @param { String } eventId - Event to subscribe to in one-shot manner. The value cannot be an empty string and exceed 10240 bytes.
 * @param { Callback1Argument<EventData> } callback - Callback to be executed when the event is received.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func once(eventId: String, callback: Callback1Argument<EventData>): Unit {
    synchronized(MUTEX_FOR_STRING_EVENT) {
        let callbackList = match (CONTROLLER_FOR_STRING_EVENT.get(eventId)) {
            case Some(v) => v
            case None =>
                let list = CallbackList()
                CONTROLLER_FOR_STRING_EVENT.add(eventId, list)
                list
        }
        callbackList.addCallback(
            callback,
            isOnce: true,
            onInitialize: { =>
                let lambdaID = getLambdaIdByStringId()
                unsafe { FfiOHOSEmitterOnStringEvent(lambdaID) }
            },
            onFailed: { =>
                EMITTER_LOG.warn("The callback has been registered.")
            }
        )
    }
}

/**
 * Emits the specified event.
 *
 * @param { InnerEvent } event - Event to emit, where EventPriority specifies the emit priority of the event.
 * @param { EventData } [ data ] - Data passed in the event.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func emit(event: InnerEvent, data!: EventData = EventData()): Unit {
    unsafe { FfiOHOSEmitterEmitWithId(event.eventId, UInt32(event.priority.getValue()), CEventData(data)) }
}

/**
 * Emits an event of a specified priority.
 *
 * @param { String } eventId - ID of the event to emit. The value cannot be an empty string and exceed 10240 bytes.
 * @param { Options } [ options ] - Event emit priority.
 * @param { EventData } [ data ] - Data passed in the event.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func emit(eventId: String, options!: Options = Options(priority: EventPriority.Low), data!: EventData = EventData()): Unit {
    unsafe {
        try (id = LibC.mallocCString(eventId).asResource()) {
            FfiOHOSEmitterEmitWithString(id.value, UInt32(options.priority.getValue()), CEventData(data))
        }
    }
}

/**
 * Unsubscribes from all events with the specified event ID.
 *
 * @param { UInt32 } eventId - ID of the event to unsubscribe from.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: UInt32): Unit {
    synchronized(MUTEX_FOR_U32_EVENT) {
        match (CONTROLLER_FOR_U32_EVENT.get(eventId)) {
            case Some(callbackList) => callbackList.removeAllCallback()
            case None => EMITTER_LOG.warn("The event has not been registered.")
        }
    }
}

/**
 * Unsubscribes from all events with the specified event ID.
 *
 * @param { String } eventId - ID of the event to unsubscribe from. The value cannot be an empty string and exceed 10240 bytes.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: String): Unit {
    synchronized(MUTEX_FOR_STRING_EVENT) {
        match (CONTROLLER_FOR_STRING_EVENT.get(eventId)) {
            case Some(callbackList) => callbackList.removeAllCallback()
            case None => EMITTER_LOG.warn("The event has not been registered.")
        }
    }
}

/**
 * Unsubscribes specified callback function from an event.
 *
 * @param { UInt32 } eventId - ID of the event to unsubscribe from.
 * @param { Callback1Argument<EventData> } callback - Callback to unregister.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: UInt32, callback: Callback1Argument<EventData>): Unit {
    synchronized(MUTEX_FOR_U32_EVENT) {
        match (CONTROLLER_FOR_U32_EVENT.get(eventId)) {
            case Some(callbackList) =>
                callbackList.removeCallback(
                    callback,
                    onFailed: {
                        => EMITTER_LOG.warn("The eventId(${eventId}) callback is not registered, no need to unregistered")
                    }
                )
            case None => EMITTER_LOG.warn("The event has not been registered.")
        }
    }
}

/**
 * Unsubscribes specified callback function from an event.
 *
 * @param { String } eventId - ID of the event to unsubscribe from. The value cannot be an empty string and exceed 10240 bytes.
 * @param { Callback1Argument<EventData> } callback - Callback to unregister.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: String, callback: Callback1Argument<EventData>): Unit {
    synchronized(MUTEX_FOR_STRING_EVENT) {
        match (CONTROLLER_FOR_STRING_EVENT.get(eventId)) {
            case Some(callbackList) =>
                callbackList.removeCallback(
                    callback,
                    onFailed: {
                        => EMITTER_LOG.warn("The eventId(${eventId}) callback is not registered, no need to unregistered")
                    }
                )
            case None => EMITTER_LOG.warn("The event has not been registered.")
        }
    }
}

func getLambdaIdByU32Id(): Int64 {
    let wrapper = { id: UInt32, value: CEventData =>
        synchronized (MUTEX_FOR_U32_EVENT) {
            if (let Some(callbackList) <- CONTROLLER_FOR_U32_EVENT.get(id)) {
                callbackList.invokeCallback(EventData(value))
            }
        }
    }
    Callback2Param<UInt32, CEventData, Unit>(wrapper).getID()
}

func getLambdaIdByStringId(): Int64 {
    let wrapper = { id: CString, value: CEventData =>
        synchronized (MUTEX_FOR_STRING_EVENT) {
            if (let Some(callbackList) <- CONTROLLER_FOR_STRING_EVENT.get(id.toString())) {
                callbackList.invokeCallback(EventData(value))
            }
        }
    }
    Callback2Param<CString, CEventData, Unit>(wrapper).getID()
}
