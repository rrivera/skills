---
name: grilling
description: Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
---

Interview the user relentlessly until you reach a shared understanding. Map this as a **design tree**: every decision branches into the decisions that hang off it.

Work the tree in **rounds**. The **frontier** is every decision whose prerequisites are already settled: the questions you can ask _now_ without guessing at answers you haven't heard yet. Ask the whole frontier in one round: number each question and give your recommended answer. Then wait for the user's answers before the next round.

### Asking Questions in Antigravity

In Antigravity / Gemini environments, you MUST use the native `ask_question` tool for each round of questions to present the choices and pause execution. Do NOT assume answers, do NOT auto-accept recommended answers, and do NOT execute subsequent steps or tools until the user responds.

When calling `ask_question`:
- Pass each frontier question into the `questions` array.
- For each question:
  - `question`: Clear question title and description of the trade-off.
  - `options`: Provide the concrete decision branches/choices. The recommended answer MUST be the first option, prefixed with `(Recommended)`.
  - `is_multi_select`: `false` (or `true` if multiple orthogonal choices can apply).
- For freeform / open-ended questions where fixed choices are inappropriate: output the question clearly in markdown and **immediately stop the turn without calling any further tools**. Wait for the user to reply.

Word each question so selecting the recommended option accepts your recommended decision.

Each round the user answers reshapes the tree: settled decisions push the frontier outward and unblock questions that depended on them. Recompute the frontier and ask the next round. A question whose answer depends on another question still open in this round belongs to a _later_ round, not this one.

Finding _facts_ is your job, never the user's. When a frontier question needs a fact from the environment (filesystem, tools, etc.), dispatch a sub-agent to find it; don't ask the user for anything you could look up yourself. Don't block on it: a running exploration is an unsettled prerequisite, so only the questions downstream of it wait for the sub-agent to report; ask the rest of the frontier now. The _decisions_ are the user's: put each to them via `ask_question` and wait.

The session is done when the frontier is empty: every branch of the design tree visited, nothing left silently assumed. Do not act on it until the user confirms you have reached a shared understanding.
