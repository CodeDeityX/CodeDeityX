# NIRIUM Protocol — Independent Adversarial Security Research

**Area:** Agentic payments, Stellar/x402, authorization integrity and pre-sign governance<br>
**Role:** Independent researcher / adversarial harness author<br>
**Evidence status:** Reproduced and credited by upstream maintainers, within the documented test scope

[Official merged PR #98](https://github.com/nirium-protocol/nirium/pull/98) · [Reproducible R1–R3 harness](https://github.com/CodeDeityX/nirium-96-agent-policy-harness) · [NIRIUM SDK documentation](https://github.com/nirium-protocol/nirium-core/blob/main/packages/sdk/README.md#pre-sign-policy-hook-experimental)

---

## The security question

A system may possess a valid cryptographic signer while lacking authorization to execute a specific payment **under the current policy**. The research examined the gap between *can sign* and *should sign*, especially in agent-controlled x402 payment flows.

## My contribution

- Designed and published a standalone, reproducible three-round (R1–R3) adversarial harness targeting NIRIUM's agent-side pre-sign policy surface.
- Examined exact authorization-context binding, policy-version freshness, fail-closed behavior, concurrent spending observations, and raw-signer boundary limitations.
- Preserved source and dependency identity, expected outcomes, and documented limitations so maintainers could independently repeat the work.
- Performed independent verification of the policy-hook changes within the test scope described in the upstream pull request.

## External reproduction

NIRIUM's maintainers credited the work in merged **[PR #98](https://github.com/nirium-protocol/nirium/pull/98)** and reported these reproduction results:

| Verification | Upstream-reported result |
|---|---:|
| Upstream tests | **170/170** |
| Adapted G1 assertions | **35/35** |
| Strict correspondence to original R2 cases | **34/35** |
| Supplementary diagnostics | **50/50** (including one intentional documented limitation) |

These are the maintainers' reproduced results, **not** claims of certification, a formal audit or deployed on-chain enforcement.

## Important boundaries

- **L01:** Pending-capacity reservation was not solved; concurrent requests can observe the same remaining capacity.
- **L02:** Code with direct access to the raw signer may bypass an agent-side policy gate.
- The scope was agent-side pre-sign behavior; this does not prove account-level enforcement, on-chain enforcement or universal production safety.
- This work does not claim authorship of NIRIUM's SDK policy-hook implementation or a completed KINEGuard–NIRIUM integration.

## Why it matters

A reproducible adversarial test, accompanied by explicit limits, can influence the design and verification of real agentic payment controls without overstating what the tests establish.

**Evidence before claims.**
