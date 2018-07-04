# todo-os-swift
A simple todo app run in iPhone. This project has no external dependencies.

## What I did

- Show the soft keyboard while entering the add new task view
- Swipe a active task to mark it finished
- Save the deleted finished items
- Refactor codes

## Build a ".app" file in debug configuration (The command is usually used in CI)
```bash
xcodebuild -project ToDoList.xcodeproj -scheme ToDoList -configuration Debug -sdk iphoneos CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_REQUIRES_TEAM=NO
```

