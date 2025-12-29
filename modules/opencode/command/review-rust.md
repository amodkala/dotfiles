---
description: Comprehensive Rust code review against idiomatic patterns from corrode.dev
agent: rust-reviewer
subtask: true
---

Perform a comprehensive Rust code review of the staged changes against idiomatic Rust patterns.

## Staged Changes

!`git diff --staged`

## Review Instructions

1. **Load the idiomatic-rust skill** for comprehensive review criteria
2. **Analyze thoroughly**:
   - High-level architectural patterns
   - Type system usage and safety
   - Line-by-line implementation details
   - Error handling approaches
   - Performance implications
   - API design decisions
3. **Check against all relevant patterns**:
   - Simplicity and avoiding over-engineering
   - Defensive programming techniques
   - Common pitfalls in safe Rust
   - Type-driven design (enums, compile-time invariants)
   - Functional patterns (iterators, expressions, immutability)
   - API design best practices
   - Standard library sharp edges
4. **Prioritize findings**: P0 (critical) → P1 (important) → P2 (suggestions)
5. **Provide actionable recommendations** with code examples

## Output Requirements

1. **Write detailed report** to: `/tmp/rust-review-!`date +%Y%m%d-%H%M%S`.md`
   - Include all findings with context
   - Provide code snippets and examples
   - Reference specific corrode.dev articles (use webfetch to read full articles when needed)
   - Suggest relevant Clippy lints
2. **Return concise summary** (~150 tokens) to parent conversation:
   - Total files and issues
   - Breakdown by priority
   - Top 3 priorities
   - Link to detailed report

## Special Considerations

- If no staged changes found: Inform user and suggest staging files
- If non-Rust files found: Review only Rust files (.rs extension)
- If test files: Apply appropriate relaxed criteria for test code
- If unsafe code: Check for proper documentation and justification
