# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

`nucleus-secondbrain-catalog` is a **public, tool-neutral skill + framework** in the NUCLEUS family. It contains no application code — it is pure Markdown specs, a concrete empty-shelf directory tree, and shell scripts. Main artifacts:

- **`blueprint/`** — the concrete, git-trackable empty-shelf directory tree. This is the repo's primary deliverable.
- **`BLUEPRINT.md`** — public, de-personalized rationale for the L1-L3 directory blueprint.
- **`SKILL.md`** — the `secondbrain-catalog` skill (v2.1). Packages the shelf-storage rules (R1–R5, 7 rules, placement decision flow) as an installable agent skill. This is what agents consume.
- **`framework/`** — scaffolding scripts for bootstrapping a new SecondBrain vault from scratch (`framework/bin/refresh-structure.sh`, `framework/bin/scaffold-guides.sh`, templates).

Supporting docs: `THEORY.md` (principles P1–P10, R1–R5, O1–O6), `NAMING-POLICY.md` (pointer to the authoritative `nucleus-governance-spec` naming standard), `README.md` (family relationships + feedback loop).

## Authority Chain

The canonical source spec is **catalog-L2-spec v3.7-baseline**, located in a private governance workspace.

Authority order: **spec > this repo (public method + blueprint) > downstream private vaults**. If `SKILL.md` or `BLUEPRINT.md` conflicts with the spec, the spec wins — fix this repo and note it.

## Family Context

| Repo | Role | Visibility |
|---|---|---|
| `nucleus-governance-spec` | PDCA governance specification | public |
| **`nucleus-secondbrain-catalog`** (this repo) | Shelf rules skill + concrete blueprint + framework scaffolding | public |
| `{private-owner}-secondbrain-vault` | downstream private instance with real content | private |

Naming follows the three-axis model `<family>-<topic>-<artifact>`. Public docs must not disclose private owner names, business lines, project names, personas, internal paths, or runtime names.

## Making Changes

- **Updating rules in `SKILL.md`**: derive from the canonical spec first; do not invent rules independently. After editing, bump the version line and `based_on:` frontmatter field.
- **Updating `framework/` scripts**: scripts must remain idempotent. Test manually — there are no automated tests.
- **`THEORY.md`**: edit only when the underlying principles (P/R/O axioms) change, not just the skill wording.
- **`NAMING-POLICY.md`**: this is a pointer file — the authoritative naming standard lives in `nucleus-governance-spec`. Only update the secondbrain-specific slice here.

## Feedback Loop (practice → methodology)

Improvements discovered in downstream private vaults must be **de-personalized** before back-porting here — strip all PII, internal paths, credentials, owner names, business lines, project names, personas, and runtime names. The flow is: spec evolves → this repo updates → private vaults follow.
