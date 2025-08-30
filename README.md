# notification_notification_cangjie_wrapper

## Introduction

The notification_notification_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Common Event Service (CES) Subsystem. OpenHarmony provides a CES for applications to subscribe to, publish, and unsubscribe from common events. The currently open CommonEvent apis only support standard devices.

Common events in OpenHarmony are classified into system common events and custom common events.

- System common event: sent by the system based on system policies to the applications that have subscribed to the event. This type of event is typically system events published by key system services, such as HAP installation, update, and uninstallation.

- Custom common events: customized by applications to implement cross-application event communication.

Each application can subscribe to common events as required. After your application subscribes to a common event, the system sends it to your application every time the event is published. Such an event may be published by the system, other applications, or your own application.

## System Architecture

**Figure 1** notification_cangjie_wrapper architecture

![notification_cangjie_wrapper Architecture](figures/notification_cangjie_wrapper_architecture_en.png)

As shown in the architecture pictures, the notification_notification_cangjie_wrapper provides interfaces for publishing public events, creating subscribers, subscribing, unsubscribing, etc.

- createSubscriber: use subscription information to create a public event subscriber, which can specify the public events the subscriber wants to subscribe to, the permissions required from the publisher, the subscriber's priority, etc.

- subscribe: complete the subscription for the specified subscriber.

- unsubscribe: cancel the subscription for the specified subscriber.

- publish: publish a common event with the specified name and attributes.

- Cangjie Notification FFI Interface Definition: Responsible for defining the C-interoperable Cangjie interface, which is used to realize Cangjie's notification capabilities.

- Common Event Manager Service: Responsible for providing the basic common event fuctions, and encapsulating the C interface for interoperation with Cangjie.

## Directory Structure

```
base/notification/notification_cangjie_wrapper
├── figures         # architecture pictures
└── ohos            # Cangjie CommonEvent code
    ├── common_event_data
    ├── common_event_manager
    ├── common_event_publish_data
    ├── common_event_subscribe_info
    ├── common_event_subscriber
    └── value_type
```

## Usage

The following features are provided:

- create subscriber.
- publish common evnet.
- subscribe common event.
- unsubscribe common event.

Compare to the ArkTs, the following features are not provided:

- send and process events between different threads within the same process or within the same thread.
- distributed notification service.

For relevant API of CommonEventManager, please refer to [ohos.common_event_manager](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/BasicServicesKit/cj-apis-common_event_manager.md); for relevant guidelines, please refer to [CommonEvent Development Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/tree/master/doc/Dev_Guide/source_en/basic-services/common-event).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[notification_common_event_service](https://gitee.com/openharmony/notification_common_event_service/blob/master)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)
