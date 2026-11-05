<p align="center">
  <img src="./assets/code-deityx-research-banner.svg" alt="CodeDeityX — independent security research, AI governance and adversarial testing" width="100%">
</p>

<h1 align="center">Aldo Israel Hernandez</h1>

<p align="center">
  <strong>Independent Security Researcher · AI Governance · Adversarial Testing</strong>
</p>

<p align="center">
  Security research for AI agents and high-consequence execution systems.<br>
  <sub>Authorization boundaries · Fail-closed behavior · Evidence-backed verification</sub>
</p>

<p align="center">
  <a href="https://github.com/nirium-protocol/nirium/pull/98"><img alt="NIRIUM — credited research" src="https://img.shields.io/badge/NIRIUM-Credited%20Research-106b57?style=flat-square"></a>
  <a href="https://github.com/buzzbysolcex/buzz-bd-agent/blob/main/README.md"><img alt="BuzzShield and AION — public architecture reference" src="https://img.shields.io/badge/BuzzShield%20%2B%20AION-Architecture%20Reference-a27c35?style=flat-square"></a>
  <a href="https://github.com/VerifywithAION"><img alt="Verify with AION — research organization" src="https://img.shields.io/badge/AION-Governed%20Execution-35455b?style=flat-square"></a>
</p>

<p align="center">
  <a href="#research-highlights">Research Highlights</a> &nbsp;·&nbsp;
  <a href="#selected-work">Projects</a> &nbsp;·&nbsp;
  <a href="#open-to-work">Open to Work</a> &nbsp;·&nbsp;
  <a href="mailto:israelhernandezpin@gmail.com">Contact</a>
</p>

<a id="research-highlights"></a>

<h2 align="center">Selected Research Highlights</h2>
<p align="center"><sub>Public evidence first. Clear technical limits. No unsupported production or audit claims.</sub></p>

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>01 / NIRIUM PROTOCOL</h3>
      <p><strong>Independent adversarial security research</strong><br><sub>Stellar · x402 · Pre-sign policy controls</sub></p>
      <p>Designed and published a reproducible R1–R3 test harness. NIRIUM maintainers independently reran it and explicitly credited the research in merged PR #98.</p>
      <p><strong>170/170</strong> upstream tests · <strong>35/35</strong> adapted G1 assertions (maintainer reproduction)</p>
      <p><a href="https://github.com/nirium-protocol/nirium/pull/98">Upstream credit and results</a> · <a href="./case-studies/nirium-adversarial-research.md">Case study</a></p>
    </td>
    <td width="50%" valign="top">
      <h3>02 / BUZZSHIELD × AION</h3>
      <p><strong>Security intelligence meets execution governance</strong><br><sub>Risk context · Wallet Guard · Decision receipts</sub></p>
      <p>Researched and documented the scoped path from upstream security signals to AION policy evaluation, including a Buzz-compatible import and advisory live-adapter design.</p>
      <p><strong>Public architecture reference</strong> · <strong>Documented integration path</strong></p>
      <p><a href="https://github.com/buzzbysolcex/buzz-bd-agent/blob/main/README.md">Public architecture</a> · <a href="./case-studies/buzzshield-aion-governance.md">Case study</a></p>
    </td>
  </tr>
</table>

<p align="center"><sub>NIRIUM: L01/L02 remain unresolved. BuzzShield × AION: scoped research and integration evidence, not a completed security audit or universal production enforcement.</sub></p>
---

## Professional Profile

I am an AI engineering student and independent technical project operator focused on using frontier AI systems to convert written requirements into structured, tested, and documented outputs.

My work emphasizes:

- Following detailed written specifications and acceptance criteria
- AI-assisted repository implementation
- Output verification and quality assurance
- Evidence collection and reproducibility
- Repository organization and technical documentation
- Pre-execution governance and safety controls
- Iterative correction when results fail validation
- Clear separation between proposed, authorized, and executed actions

I am currently enrolled in a **52-Week AI Engineering Bootcamp** while developing practical projects through the [Verify with AION](https://github.com/VerifywithAION) organization.

> This portfolio represents AI-assisted technical execution and project coordination. My contribution includes requirements definition, implementation coordination, verification, documentation, repository management, acceptance testing, and evidence review.

---

## What I Can Contribute

| Capability | Practical contribution |
|---|---|
| Written-instruction execution | Follow detailed procedures, specifications, checklists, and task boundaries |
| AI evaluation | Compare outputs against written requirements, evidence, and quality criteria |
| Quality assurance | Detect inconsistencies, unsupported claims, regressions, and incomplete work |
| Repository operations | Maintain Git workflows, organize files, document changes, and preserve evidence |
| AI-assisted implementation | Coordinate frontier AI tools to produce and refine technical deliverables |
| Technical documentation | Produce structured reports, READMEs, validation records, and case studies |
| Data review | Classify, verify, compare, label, and document structured information |
| Independent remote work | Execute asynchronously through written instructions and structured reporting |

---

<a id="selected-work"></a>

## Selected Work

### Featured Open-Source Contribution - Nirium Protocol

**Independent Security Research | Stellar/x402 | Adversarial Testing**

Designed and published a reproducible R1-R3 adversarial harness to evaluate Nirium/x402 agent-side pre-sign policy behavior: exact authorization binding, stale-policy decisions, fail-closed outcomes, and signer-boundary limitations.

**Independently reproduced by Nirium:** The maintainers credited Aldo Israel Hernandez (@CodeDeityX) in merged PR #98. Their documented reproduction reported 170/170 upstream tests and 35/35 adapted G1 assertions passing.

**Scope:** Independent testing, not authorship of the Nirium SDK hook. L01 pending-capacity reservation and L02 raw-signer bypass remain unresolved. No completed KINEGuard-to-Nirium integration is claimed.

[Official upstream credit - PR #98](https://github.com/nirium-protocol/nirium/pull/98) | [Reproducible harness](https://github.com/CodeDeityX/nirium-96-agent-policy-harness) | [SDK acknowledgment](https://github.com/nirium-protocol/nirium-core/blob/main/packages/sdk/README.md#pre-sign-policy-hook-experimental)

---

### Applied Security Research - BuzzShield x AION

**Security Intelligence Integration | Conditional Exploitability | Pre-Execution Governance**

Contributed to a scoped research and integration workflow linking BuzzShield-originated security signals with AION/Wallet Guard governance. The work normalized upstream risk findings, evaluated action and deployment context, and produced structured ALLOW / WARN / BLOCK-style decisions supported by evidence-oriented receipts.

**Research focus:** Tested exploit-derived risk scenarios, including Huma and Wasabi case inputs, and explored the Reserve L1b-1089 conditional-governance pattern: distinguishing a code-level risk finding from whether the deployment state satisfies the conditions needed for exploitation.

**Evidence and boundaries:** BuzzShield publicly references Wallet Guard (AION) as its pre-execution governance component. AION public documentation describes a Buzz-compatible import and an advisory live-adapter path. This is scoped integration and research work, not authorship of BuzzShield, an independently verified vulnerability discovery, a bounty award, or proof of universal production enforcement.

[BuzzShield public architecture](https://github.com/buzzbysolcex/buzz-bd-agent/blob/main/README.md) | [AION Buzz-compatible import](https://github.com/VerifywithAION/aion-finops-guard-lite/blob/main/docs/evidence/domain/BUZZ_COMPATIBLE_IMPORT_EXECUTION_PROOF_V1.md) | [AION live-adapter evidence](https://github.com/VerifywithAION/aion-finops-guard-lite/blob/main/docs/evidence/domain/BUZZ_LIVE_ADAPTER_EXECUTION_PROOF_V1.md)

---

### AION Guard Lite

**Pre-execution governance for proposed AI and software actions.**

AION Guard Lite explores a simple principle: technical capability does not automatically establish authorization.

**My contribution**

- Defined the project objective and governance boundaries
- Coordinated AI-assisted implementation
- Reviewed outputs against acceptance criteria
- Validated repository behavior and documentation
- Maintained evidence records and claim boundaries

[View repository](https://github.com/VerifywithAION/aion-guard-lite) | [Read case study](./case-studies/aion-guard-lite.md)

---

### AION Proof Lab

**Evidence-backed validation of technical claims and outputs.**

AION Proof Lab explores how generated claims can be connected to reproducible evidence rather than accepted because they sound convincing.

**My contribution**

- Defined validation and proof requirements
- Coordinated structured experiments
- Reviewed generated artifacts
- Documented limitations and evidence boundaries
- Preserved reproducible outputs

[View repository](https://github.com/VerifywithAION/aion-proof-lab) | [Read case study](./case-studies/aion-proof-lab.md)

---

### AION ICLI

**A governed command-line workflow for controlled execution.**

AION ICLI separates proposed actions, authorization, execution, and evidence.

**My contribution**

- Developed the project concept and workflow requirements
- Coordinated frontier-AI-assisted implementation
- Reviewed implementation against governance constraints
- Validated outputs and repository state
- Documented intended behavior and limitations

[View repository](https://github.com/VerifywithAION/aion-icli) | [Read case study](./case-studies/aion-icli.md)

---

## Demonstration Work Samples

- [AI Output Evaluation Checklist](./samples/ai-evaluation-checklist.md)
- [Quality Assurance Review Example](./samples/qa-review-example.md)
- [Structured Task Completion Report](./samples/structured-task-report.md)

---

## How I Work

<pre>
Receive written objective
        |
Identify constraints and acceptance criteria
        |
Break the objective into verifiable tasks
        |
Execute through approved tools and workflows
        |
Review outputs against requirements
        |
Correct failures or inconsistencies
        |
Document evidence, limitations, and final status
</pre>

I am particularly comfortable with work that is:

- Asynchronous
- Written and process-driven
- Repetitive when necessary
- Evaluated against measurable criteria
- Documented through checklists and evidence
- Performed independently with clear escalation rules

---

## Current Learning

- AI engineering fundamentals
- JavaScript and TypeScript
- Git and GitHub workflows
- AI-assisted software development
- Large-language-model evaluation
- AI governance and safety
- Repository analysis
- Testing and technical quality assurance
- Structured data and evidence workflows

---

<a id="open-to-work"></a>

## Open to Work

I am seeking remote entry-level opportunities such as:

- AI Data Annotator
- AI Training Contributor
- AI Response Evaluator
- AI Quality Reviewer
- AI Operations Assistant
- Data Quality Associate
- Junior Quality Assurance Analyst
- Technical Documentation Assistant
- Research Data Reviewer
- Repository Operations Assistant

### Availability

- Available immediately
- Based in Mexico
- Open to worldwide remote contractor opportunities
- Flexible schedule
- Comfortable with extended working hours when project requirements justify them
- English and Spanish written communication
- Preference for asynchronous, written-instruction environments

---

## Organization

My broader project work is maintained through [Verify with AION](https://github.com/VerifywithAION), an experimental engineering organization exploring:

- AI governance
- Software verification
- Evidence-backed execution
- Repository intelligence
- Security-oriented AI workflows
- Controlled autonomous systems

---

## Contact

**Aldo Israel Hernandez**

Email: [israelhernandezpin@gmail.com](mailto:israelhernandezpin@gmail.com)

GitHub: [github.com/CodeDeityX](https://github.com/CodeDeityX)

Organization: [github.com/VerifywithAION](https://github.com/VerifywithAION)

---

<p align="center">
  <em>Verification before execution. Evidence before claims.</em>
</p>