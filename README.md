# Suji-Onboarding Reflection

## Demo
https://github.com/user-attachments/assets/12e662b1-785a-48bf-aadb-66076fce9470

## Overview
Very engaging task that targets state management, navigation flow, and clean UI/UX. I quite enjoyed the idea of testing something different with each view. I also loved the openness in terms of architecture and design decisions, it gives real ownership of the task, which I value a lot.

---

## Architecture & State Decisions
My architecture looked like this:

| Directory / File          | Responsibility |
|---------------------------|----------------|
| **Models**                | User data, gender types, focus areas selected by the user |
| **State**                 | `UserState` file responsible for storing and resetting user data |
| **Extensions**            | Distributed view logic to keep views light and easy to read |
| **Components**            | Reusable components such as the red continue button and toolbar logout button |
| **OnboardingRoute**       | Navigation path definition |
| **Views**                 | Individual onboarding screens |
| **Suji_ChallengeApp.swift** | Root app configuration |

I separated the different aspects of the app into different directories, each responsible for keeping the implementation clean and efficient.  

---

## UI / UX Considerations
I usually start by defining a Finite-State Machine (FSM) diagram to fully understand the entire flow and structure of a project. However, in this case, the Figma specifications were clear and well-structured, which eliminated that task for me. I was able to clearly comprehend what followed up after what.

I tried to follow the Figma closely while also thinking about practical UI behaviour, especially around navigation flow and button positioning.

---

## Technical Challenges & Learning
With every iOS project, I aim to learn something new that will be applicable in the future. This time it was defining and fully implementing a path-based `NavigationStack`.

Although I had interacted with it before, I had never structured an entire onboarding flow around it. I learnt how to better plan navigation state and how SwiftUI handles stack updates declaratively.

---

## Trade-offs & Alternatives
I decided not to introduce patterns such as MVVM, as I felt it would have added unnecessary complexity for this scope. This task was more about clear state flow handling and ownership. 

---

## Future Improvements
I would want to further research whether the `GeometryReader` in `EmailView` was strictly necessary, as I initially thought the auto-scroll behaviour could be handled more declaratively by SwiftUI.

Minor refinements around padding and sizing consistency could also be improved with more time.

---

## Connection to Dissertation
I plan to use the path-based `NavigationStack` approach in my dissertation project, as currently navigation is not handled as cleanly as the path-based structure allows.

---

## Closing Note
I would like to thank Findlay and Adam for designing such a fun challenge. I genuinely enjoyed working on it, and it targeted concepts that, I believe, are valuable to strengthen in SwiftUI development.
