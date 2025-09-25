# notification_notification_cangjie_wrapper

## Introduction

The notification_notification_cangjie_wrapper offers event communication capabilities for developers engaged in application development using the Cangjie programming language. OpenHarmony provides a Common Event Service (CES) for applications to subscribe to, publish, and unsubscribe from common events. The currently open notification_notification_cangjie_wrapper only supports standard devices.

Common events can be divided into system common events and custom common events.

- System common events: The system collects event information and sends it to user programs that have subscribed to the event according to system policies. For example: system events published by key system services, HAP installation, update, uninstallation, etc.

- Custom common events: Applications customize some common events to implement cross-application event communication capabilities.

Each application can subscribe to common events as needed. If an application subscribes successfully and the corresponding subscribed common event is published, the system will send it to the application. These common events may come from the system, other applications, and the application itself.

## System Architecture

**Figure 1** notification_cangjie_wrapper architecture

![notification_cangjie_wrapper Architecture](figures/notification_cangjie_wrapper_architecture_en.png)

As shown in the architecture diagram, the notification Cangjie API provides the capabilities to publish common events, create subscribers, subscribe, and unsubscribe.

Interface Layer:

- createSubscriber: Provides developers with the capability to create common event subscribers based on subscription information. The subscription information can specify the common events to be subscribed to, the permissions that event publishers must have, and the priority of the subscriber, among other details.
- subscribe: Provides developers with the capability to perform subscription operations for specified subscribers.
- unsubscribe: Provides developers with the capability to perform unsubscription operations for specified subscribers.
- publish: Provides developers with the capability to publish custom common events with specified names and attributes.

Framework Layer:

- CreateSubscriber Wrapper: Implements the encapsulation of subscriber management based on the common event management service provided by the underlying common event subsystem. It enables the capability to create common event subscribers, which is used to obtain information related to received common events and set processing information for common events.
- Subscribe Wrapper: Implements the encapsulation of subscriber management based on the common event management service provided by the underlying common event subsystem, enabling the subscription capability for specified subscribers.
- Unsubscribe Wrapper: Implements the encapsulation of subscriber management based on the common event management service provided by the underlying common event subsystem, enabling the unsubscription capability for specified subscribers.
- Publish Wrapper: Implements the encapsulation of subscriber management based on the common event management service provided by the underlying common event subsystem, enabling the capability to publish custom common events.

Dependency Components Introduction in Architecture:

- common_event_service: Relies on the common event management service capabilities provided by the common event subsystem for the implementation of framework layer capabilities.
- hiviewdfx_cangjie_wrapper: Depends on HiLog capabilities for printing logs at key points.
- cangjie_ark_interop: Depends on APILevel class definitions and BusinessException class definitions for API annotation and throwing exceptions to users in error branches.

## Directory Structure

```
base/notification/notification_cangjie_wrapper
├── figures         # architecture pictures
└── ohos            # Cangjie notification interface implementation
│   ├── common_event_data           # Common event data module
│   ├── common_event_manager        # Common event management module
│   ├── common_event_publish_data   # Common event publish data module
│   ├── common_event_subscribe_info # Common event subscribe info module
│   ├── common_event_subscriber     # Common event subscriber module
│   └── value_type                  # Common event multi-value type implementation
└── test            # Cangjie notification test cases
    └── common_event_manager # Common event test cases
```

## Usage

The current notification Cangjie API provides the following functions:

- Publish common events.
- Create subscribers.
- Subscribe to common events.
- Unsubscribe.

For common event related APIs, please refer to [ohos.common_event_manager](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/BasicServicesKit/cj-apis-common_event_manager.md). For related guidelines, please refer to [Common Event Development Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/tree/master/doc/Dev_Guide/source_en/basic-services/common-event).

## Constraints

Compared to ArkTS API, the following functions are not supported:

- The ability to send and process events between different threads within the same process or within the same thread.
- User notification service.

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[notification_common_event_service](https://gitcode.com/openharmony/notification_common_event_service)