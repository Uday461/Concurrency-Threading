#  Dispatch Queue

## Different types of dispatch queue
- Main Queue
- System provided Global Concurrent Queue
- Custom Queues

## Main Queue
- It is system created Queue.
- It is serial Queue.
- It uses Main Thread for execution.
- UIKit is tied to Main Thread. So all UI related operations must be performed on Main Queue.

## Global Concurrent Queue
- It is system created Queue.
- It is concurrent Queue.
- It doesn't use Main Thread for execution.
- Priorities are added through QoS (Quality of Service). 

# Quality of Service

- Quality of Service tells how resources should be utilised to get our job done (that is task execution should be done.).
- Various QoS: User Interactive, User Initiated, Utility, Background -- (Priority of QoS goes from Top (UserInteractive) being High to Down (Background) being Low in the below description,)

  ## QoS                When To Use             Question Need to be asked to apply the QoS (If yes apply)
  - UserInteractive           Animations                           Involved in updating UI ??
  - UserInitiated             Immediate Results                    Data Required for seamless user experience ??
  - Utility                   Long Running Tasks                   Is user aware of the progress ??
  - Background                Not visible to user                  Is user aware of the task ?? [If no - go for this QoS]

- The other two QoS are 'Default' and 'Unspecified'. 'Default' falls between 'UserInitiated' and 'Utility'. 'Unspecified' means absence of QoS information and priority wise it is least.

# Attributes

- It is one of the parameters when we create a custom Queue. It takes three values: '.concurrent' & '.initiallyInactive' & [.concurrent, .initiallyInactive]

- By default Dispatch Queues are serial in nature, if we wish to change the Dispatch Queue nature other than it to be serial Queue we can do it by providing above values in attributes parameter in initializer of 'DispatchQueue'.

- InitiallyInactive attribute is used to execute the tasks dispatched to Queue later by calling object of DispatchQueue with "activate()" method of the dispatch Queue object.

# Target Queues

- A queue that your custom queue will use behind the scenes.
- A dispatch queue's priority is inherited from its target queue.
- If we don't specify priority(QoS) of custom Dispatch Queue, the priority will be 'Default'.

# Auto Release Frequency

- Constants indicating the frequency with which the dispatchQueue autoreleases objects.
- It provides three options.
  ## .inherit - Inherit from target Queue (Default behaviour).
  ## .workItem - Individual auto release pool. (An auto release pool is set for the particular DispatchQueue.)
  ## .never - Never set up an individual auto release pool.
  
  
