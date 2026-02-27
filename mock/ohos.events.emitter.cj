/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.events.emitter

import ohos.callback_invoke.Callback1Argument
import ohos.labels.APILevel
import std.collection.HashMap

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func on(event: InnerEvent, callback: Callback1Argument<EventData>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func on(eventId: String, callback: Callback1Argument<EventData>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func once(event: InnerEvent, callback: Callback1Argument<EventData>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func once(eventId: String, callback: Callback1Argument<EventData>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func emit(event: InnerEvent, data!: EventData = EventData()): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func emit(eventId: String, options!: Options = Options(priority: EventPriority.Low), data!: EventData = EventData()): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: UInt32): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: String): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: UInt32, callback: Callback1Argument<EventData>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public func off(eventId: String, callback: Callback1Argument<EventData>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public class EventData {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var data: HashMap<String, EventDataType>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public init(data!: HashMap<String, EventDataType> = HashMap<String, EventDataType>()) {
        this.data = data
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public class InnerEvent {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var eventId: UInt32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var priority: EventPriority

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public init(eventId: UInt32, priority!: EventPriority = EventPriority.Low) {
        this.eventId = eventId
        this.priority = priority
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public class Options {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public var priority: EventPriority

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public init(priority!: EventPriority = EventPriority.Low) {
        this.priority = priority
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public enum EventPriority {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Immediate

    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    High

    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Low

    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Idle
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Emitter"
]
public enum EventDataType {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    Int64Value(Int64)
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    BoolValue(Bool)
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Emitter"
    ]
    StringValue(String)
    | ...
}
