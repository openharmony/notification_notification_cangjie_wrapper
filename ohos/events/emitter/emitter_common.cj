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

import ohos.labels.APILevel
import ohos.callback_invoke.{Callback1Argument}

import std.collection.HashMap

/**
 * Describes data passed in the event.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public class EventData {
    /**
     * Data carried by the event.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var data: HashMap<String, EventDataType>

    /**
     * EventData constructor.
     *
     * @param { HashMap<String, EventDataType> } [ data ] - Data carried by the event.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public init(data!: HashMap<String, EventDataType> = HashMap<String, EventDataType>()) {
        this.data = data
    }

    init(cData: CEventData) {
        data = HashMap<String, EventDataType>()
        for (i in 0..cData.size) {
            let p = unsafe { cData.parameters.read(i) }
            let key = p.key.toString()
            let value = unsafe {
                match {
                    case p.valueType == I64_TYPE => Int64Value(CPointer<Int64>(p.value).read())
                    case p.valueType == BOOL_TYPE => BoolValue(CPointer<Bool>(p.value).read())
                    case _ => // p.valueType == STR_TYPE
                        StringValue(CString(CPointer<UInt8>(p.value)).toString())
                }
            }
            data.add(key, value)
        }
    }
}

/**
 * Describes an event to subscribe to or emit. The EventPriority settings do not take effect under event subscription.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public class InnerEvent {
    /**
     * Event ID, which is used to identify an event
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var eventId: UInt32

    /**
     * Event priority of the event.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var priority: EventPriority

    /**
     * InnerEvent constructor.
     *
     * @param { UInt32 } eventId - Event ID, which is used to identify an event.
     * @param { EventPriority } [ priority ] - Event priority of the event. The default value is EventPriority.LOW.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public init(eventId: UInt32, priority!: EventPriority = EventPriority.Low) {
        this.eventId = eventId
        this.priority = priority
    }
}

/**
 * Describes the optional arguments of emit operation.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public class Options {
    /**
     * Event priority of the event.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var priority: EventPriority

    /**
     * Options constructor.
     *
     * @param { EventPriority } [ priority ] - Event priority of the event. The default value is EventPriority.LOW.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public init(priority!: EventPriority = EventPriority.Low) {
        this.priority = priority
    }
}

/**
 * Indicates the emit priority of the event.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public enum EventPriority {
    /**
     * Indicates that the event will be emitted immediately.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Immediate
    /**
     * Indicates that the event will be emitted before low-priority events.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    High
    /**
     * Indicates that the event will be emitted before idle-priority events. By default, an event is in LOW priority.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Low
    /**
     * Indicates that the event will be emitted after all the other events.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Idle
    | ...

    func getValue(): Int64 {
        match (this) {
            case Immediate => 0
            case High => 1
            case Low => 2
            case Idle => 3
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the event data types.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public enum EventDataType {
    /**
     * Integer event data type.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Int64Value(Int64)
    /**
     * Boolean event data type.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    BoolValue(Bool)
    /**
     * String event data type.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    StringValue(String)
    | ...
}

class EventCallback {
    let callback: Callback1Argument<EventData>
    var once: Bool
    var isFinished: Bool

    init (callback: Callback1Argument<EventData>, once!: Bool, isFinished!: Bool) {
        this.callback = callback
        this.once = once
        this.isFinished = isFinished
    }
}

