# Interactive Skill Execution Guidelines

- When running interactive interview, grilling, or decision-making skills (including `grilling`, `grill-me`, `grill-with-docs`, `wizard`, `to-tickets`, `diagnosing-bugs`, or `setup-matt-pocock-skills`):
  - You MUST use the native `ask_question` tool to present questions, options, and recommended answers to the user, and pause execution for their response.
  - When calling `ask_question`:
    - Prefix the recommended choice with `(Recommended)` in the first position of `options`.
    - Provide clear, mutually exclusive decision branches.
  - If asking questions in free-form prose (where multiple choice is not applicable), state the questions clearly in text and **immediately yield the turn without invoking any tools in the same turn**.
  - NEVER assume the user's answer, auto-accept recommended answers, or proceed with subsequent file creation, ticket publishing, or code changes until the user has explicitly submitted their response.
