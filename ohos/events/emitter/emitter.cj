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

import ohos.callback_invoke.{CallbackObject, Callback1Argument}
import ohos.ffi.Callback1Param
import ohos.labels.APILevel

import std.collection.{HashMap, ArrayList}
import std.sync.Mutex

let CALLBACK_MAP_FOR_STRING_EVENT: HashMap<String, ArrayList<EventCallback>> = HashMap<String, ArrayList<EventCallback>>()
let CALLBACK_MAP_FOR_U32_EVENT: HashMap<UInt32, ArrayList<EventCallback>> = HashMap<UInt32, ArrayList<EventCallback>>()
let MUTEX_FOR_STRING_EVENT: Mutex = Mutex()
let MUTEX_FOR_U32_EVENT: Mutex = Mutex()

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
        match (CALLBACK_MAP_FOR_U32_EVENT.get(eventId)) {
            case Some(callbackList) => 
                if (let Some(v) <- findCallbackObject(callbackList, callback)) {
                    v.isFinished = false
                    v.once = false
                    return
                }
                callbackList.add(EventCallback(callback, once: false, isFinished: false))
                return
            case None =>
                CALLBACK_MAP_FOR_U32_EVENT.add(eventId,
                    ArrayList<EventCallback>([EventCallback(callback, once: false, isFinished: false)]))
        }
        let callbackList = CALLBACK_MAP_FOR_U32_EVENT[eventId]
        let lambdaID = getLambdaId(callbackList, MUTEX_FOR_U32_EVENT)
        unsafe { FfiOHOSEmitterOnU32Event(eventId, lambdaID) }
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
        match (CALLBACK_MAP_FOR_STRING_EVENT.get(eventId)) {
            case Some(callbackList) => 
                if (let Some(v) <- findCallbackObject(callbackList, callback)) {
                    v.isFinished = false
                    v.once = false
                    return
                }
                callbackList.add(EventCallback(callback, once: false, isFinished: false))
                return
            case None =>
                CALLBACK_MAP_FOR_STRING_EVENT.add(eventId,
                    ArrayList<EventCallback>([EventCallback(callback, once: false, isFinished: false)]))
        }
        let callbackList = CALLBACK_MAP_FOR_STRING_EVENT[eventId]
        let lambdaID = getLambdaId(callbackList, MUTEX_FOR_STRING_EVENT)
        unsafe { 
            try (id = LibC.mallocCString(eventId).asResource()) {
                FfiOHOSEmitterOnStringEvent(id.value, lambdaID)
            }
         }
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
        match (CALLBACK_MAP_FOR_U32_EVENT.get(eventId)) {
            case Some(callbackList) => 
                if (let Some(v) <- findCallbackObject(callbackList, callback)) {
                    v.isFinished = false
                    v.once = true
                    return
                }
                callbackList.add(EventCallback(callback, once: true, isFinished: false))
                return
            case None =>
                CALLBACK_MAP_FOR_U32_EVENT.add(eventId,
                    ArrayList<EventCallback>([EventCallback(callback, once: true, isFinished: false)]))
        }
        let callbackList = CALLBACK_MAP_FOR_U32_EVENT[eventId]
        let lambdaID = getLambdaId(callbackList, MUTEX_FOR_U32_EVENT)
        unsafe { FfiOHOSEmitterOnceU32Event(eventId, lambdaID) }
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
        match (CALLBACK_MAP_FOR_STRING_EVENT.get(eventId)) {
            case Some(callbackList) => 
                if (let Some(v) <- findCallbackObject(callbackList, callback)) {
                    v.isFinished = false
                    v.once = true
                    return
                }
                callbackList.add(EventCallback(callback, once: true, isFinished: false))
                return
            case None =>
                CALLBACK_MAP_FOR_STRING_EVENT.add(eventId,
                    ArrayList<EventCallback>([EventCallback(callback, once: true, isFinished: false)]))
        }
        let callbackList = CALLBACK_MAP_FOR_STRING_EVENT[eventId]
        let lambdaID = getLambdaId(callbackList, MUTEX_FOR_STRING_EVENT)
        unsafe {
            try (id = LibC.mallocCString(eventId).asResource()) {
                FfiOHOSEmitterOnceStringEvent(id.value, lambdaID)
            }
        }
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
        if (CALLBACK_MAP_FOR_U32_EVENT.remove(eventId).isSome()) {
            unsafe { FfiOHOSEmitterOffU32Event(eventId) }
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
        if (CALLBACK_MAP_FOR_STRING_EVENT.remove(eventId).isSome()) {
            unsafe { 
                try (id = LibC.mallocCString(eventId).asResource()) {
                    FfiOHOSEmitterOffStringEvent(id.value)
                }
            }
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
        if (let Some(callbackList) <- CALLBACK_MAP_FOR_U32_EVENT.get(eventId)) {
            removeEventCallback(callbackList, callback)
            if (callbackList.isEmpty()) {
                CALLBACK_MAP_FOR_U32_EVENT.remove(eventId)
                unsafe { FfiOHOSEmitterOffU32Event(eventId) }
            }
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
        if (let Some(callbackList) <- CALLBACK_MAP_FOR_STRING_EVENT.get(eventId)) {
            removeEventCallback(callbackList, callback)
            if (callbackList.isEmpty()) {
                CALLBACK_MAP_FOR_STRING_EVENT.remove(eventId)
                unsafe {
                    try (id = LibC.mallocCString(eventId).asResource()) {
                        FfiOHOSEmitterOffStringEvent(id.value)
                    }
                }
            }
        }
    }
}

func findCallbackObject(list: ArrayList<EventCallback>, callback: CallbackObject): ?EventCallback {
    for (item in list) {
        if (refEq(callback, item.callback)) {
            return item
        }
    }
    return None
}

func removeEventCallback(list: ArrayList<EventCallback>, callback: CallbackObject): Unit {
    for (i in 0..list.size) {
        if (refEq(callback, list[i].callback)) {
            list.remove(at: i)
            return
        }
    }
}

func getLambdaId(callbackList: ArrayList<EventCallback>, mutex: Mutex): Int64 {
    let wrapper = { value: CEventData =>
        let callbacks = synchronized (mutex) {
            let list = ArrayList<EventCallback>()
            for (callback in callbackList) {
                let eventCallback = EventCallback(callback.callback, once: callback.once, isFinished: callback.isFinished)
                list.add(eventCallback)
                callback.isFinished = true
            }
            list
        }
        for (eventCallback in callbacks) {
            if (eventCallback.once && eventCallback.isFinished) {
                continue
            }
            eventCallback.callback.invoke(None, EventData(value))
        }
    }
    Callback1Param<CEventData, Unit>(wrapper).getID()
}