& {
    $ErrorActionPreference = "Stop"
    Set-StrictMode -Version Latest

    $RepoPath = "C:\Users\saxom\OneDrive\Documentos\FridayWorkspace\CodeDeityX"
    $CaseStudiesPath = Join-Path $RepoPath "case-studies"
    $SamplesPath = Join-Path $RepoPath "samples"

    $Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

    function Write-Utf8File {
        param(
            [Parameter(Mandatory = $true)]
            [string]$Path,

            [Parameter(Mandatory = $true)]
            [AllowEmptyString()]
            [string[]]$Lines
        )

        $Parent = Split-Path -Parent $Path

        if (-not (Test-Path -LiteralPath $Parent)) {
            New-Item -ItemType Directory -Path $Parent -Force | Out-Null
        }

        $Content = $Lines -join [Environment]::NewLine

        [System.IO.File]::WriteAllText(
            $Path,
            $Content,
            $Utf8NoBom
        )
    }

    Write-Host ""
    Write-Host "========================================================" -ForegroundColor Cyan
    Write-Host " PART 5: Creating Portfolio Evidence Documents" -ForegroundColor Cyan
    Write-Host "========================================================" -ForegroundColor Cyan
    Write-Host ""

    if (-not (Test-Path -LiteralPath $RepoPath)) {
        throw "Repository does not exist: $RepoPath"
    }

    New-Item -ItemType Directory -Path $CaseStudiesPath -Force | Out-Null
    New-Item -ItemType Directory -Path $SamplesPath -Force | Out-Null

    # ------------------------------------------------------------
    # Case study 1: AION Guard Lite
    # ------------------------------------------------------------

    Write-Utf8File `
        -Path (Join-Path $CaseStudiesPath "aion-guard-lite.md") `
        -Lines @(
            '# AION Guard Lite'
            ''
            '## Engineering Case Study'
            ''
            '### Executive Summary'
            ''
            'AION Guard Lite is an experimental pre-execution governance project designed to evaluate a proposed action before execution occurs.'
            ''
            'The project examines a practical question:'
            ''
            '> How can an AI-assisted system distinguish between an action being technically possible and that action being authorized?'
            ''
            '### Problem'
            ''
            'AI agents and automation tools may be technically capable of executing commands, calling services, or modifying resources without having sufficient authorization.'
            ''
            'Potential failures include:'
            ''
            '- Executing outside the intended scope'
            '- Treating technical capability as permission'
            '- Misrepresenting simulated behavior as real execution'
            '- Exceeding financial or operational limits'
            '- Producing claims without supporting evidence'
            '- Performing irreversible actions prematurely'
            ''
            '### Objective'
            ''
            'Create a lightweight workflow that can:'
            ''
            '1. Receive a proposed action'
            '2. Evaluate the action against explicit policies'
            '3. Produce an approval, rejection, or blocked decision'
            '4. Preserve evidence explaining the decision'
            '5. Keep evaluation separate from execution'
            ''
            '### My Contribution'
            ''
            '- Defined the project objective and core governance concepts'
            '- Established claim and execution boundaries'
            '- Converted the concept into phased implementation requirements'
            '- Coordinated frontier-AI-assisted development'
            '- Reviewed implementation results against acceptance criteria'
            '- Ran validation and repository checks'
            '- Required corrections when outputs did not match evidence'
            '- Maintained documentation and project continuity'
            ''
            '### Capabilities Demonstrated'
            ''
            '- Requirements interpretation'
            '- AI-assisted technical execution'
            '- Quality assurance'
            '- Evidence review'
            '- Repository operations'
            '- Governance analysis'
            '- Structured documentation'
            '- Acceptance-criteria validation'
            ''
            '### Current Status'
            ''
            'Experimental and educational.'
            ''
            'It is not presented as an independently audited production security product.'
            ''
            '### Repository'
            ''
            '[View AION Guard Lite](https://github.com/VerifywithAION/aion-guard-lite)'
            ''
            '[Return to profile](../README.md)'
        )

    # ------------------------------------------------------------
    # Case study 2: AION Proof Lab
    # ------------------------------------------------------------

    Write-Utf8File `
        -Path (Join-Path $CaseStudiesPath "aion-proof-lab.md") `
        -Lines @(
            '# AION Proof Lab'
            ''
            '## Engineering Case Study'
            ''
            '### Executive Summary'
            ''
            'AION Proof Lab is an experimental environment for evaluating whether technical claims are supported by reproducible evidence.'
            ''
            '### Problem'
            ''
            'AI-generated explanations can sound convincing even when:'
            ''
            '- No external action occurred'
            '- A test was never executed'
            '- Evidence is incomplete'
            '- Results cannot be reproduced'
            '- A simulation is described as a real-world result'
            '- A passing preflight check is represented as successful execution'
            ''
            '### Objective'
            ''
            'Develop structured workflows that distinguish among:'
            ''
            '- Proposed behavior'
            '- Modeled behavior'
            '- Simulated behavior'
            '- Preflight validation'
            '- Verified execution'
            '- Unsupported claims'
            ''
            '### My Contribution'
            ''
            '- Defined the evidence-first project direction'
            '- Established requirements for traceable outputs'
            '- Coordinated AI-assisted implementation'
            '- Reviewed generated reports and repository artifacts'
            '- Compared claims against available evidence'
            '- Documented limitations and unresolved observations'
            '- Preserved validation records and project history'
            ''
            '### Capabilities Demonstrated'
            ''
            '- AI output evaluation'
            '- Evidence reconciliation'
            '- Claim-boundary review'
            '- Technical quality assurance'
            '- Structured reporting'
            '- Reproducibility analysis'
            '- Documentation discipline'
            ''
            '### Current Status'
            ''
            'Experimental research and engineering work.'
            ''
            'Results should be interpreted only within the evidence and limitations documented in the project.'
            ''
            '### Repository'
            ''
            '[View AION Proof Lab](https://github.com/VerifywithAION/aion-proof-lab)'
            ''
            '[Return to profile](../README.md)'
        )

    # ------------------------------------------------------------
    # Case study 3: AION ICLI
    # ------------------------------------------------------------

    Write-Utf8File `
        -Path (Join-Path $CaseStudiesPath "aion-icli.md") `
        -Lines @(
            '# AION ICLI'
            ''
            '## Engineering Case Study'
            ''
            '### Executive Summary'
            ''
            'AION ICLI explores a governed command-line workflow that separates a requested action from authorization, execution, and proof.'
            ''
            '### Core Workflow'
            ''
            '<pre>'
            'Request'
            '  |'
            'Preflight evaluation'
            '  |'
            'Authorization decision'
            '  |'
            'Controlled execution'
            '  |'
            'Evidence and receipt'
            '</pre>'
            ''
            '### Problem'
            ''
            'Traditional command-line tools frequently assume that an instruction should be executed immediately.'
            ''
            'AI-assisted environments require stronger boundaries because generated commands may be:'
            ''
            '- Incorrect'
            '- Excessively broad'
            '- Unsafe'
            '- Unauthorized'
            '- Based on incomplete context'
            '- Difficult to reverse'
            ''
            '### Objective'
            ''
            'Design a workflow where execution is treated as a governed state transition rather than an automatic response to a generated instruction.'
            ''
            '### My Contribution'
            ''
            '- Defined the product concept and operating principles'
            '- Established workflow and governance requirements'
            '- Coordinated frontier-AI-assisted implementation'
            '- Reviewed generated code and documentation'
            '- Verified repository state and acceptance criteria'
            '- Required correction of inconsistent or unsupported behavior'
            '- Maintained evidence and project continuity'
            ''
            '### Capabilities Demonstrated'
            ''
            '- Workflow design'
            '- AI-assisted project coordination'
            '- Repository validation'
            '- Governance reasoning'
            '- Technical documentation'
            '- Quality control'
            '- Structured execution reporting'
            ''
            '### Current Status'
            ''
            'Experimental.'
            ''
            'It is not presented as a replacement for established enterprise authorization or security systems.'
            ''
            '### Repository'
            ''
            '[View AION ICLI](https://github.com/VerifywithAION/aion-icli)'
            ''
            '[Return to profile](../README.md)'
        )

    # ------------------------------------------------------------
    # Sample 1: AI output evaluation checklist
    # ------------------------------------------------------------

    Write-Utf8File `
        -Path (Join-Path $SamplesPath "ai-evaluation-checklist.md") `
        -Lines @(
            '# AI Output Evaluation Checklist'
            ''
            '## Purpose'
            ''
            'Use this checklist to evaluate an AI-generated response, classification, report, or technical output against written instructions.'
            ''
            '## 1. Instruction Compliance'
            ''
            '- [ ] Did the output address the requested task?'
            '- [ ] Were all explicit constraints followed?'
            '- [ ] Were prohibited actions avoided?'
            '- [ ] Was the requested format used?'
            '- [ ] Were all required fields included?'
            ''
            '## 2. Accuracy'
            ''
            '- [ ] Are factual claims supported?'
            '- [ ] Are calculations correct?'
            '- [ ] Are technical terms used accurately?'
            '- [ ] Does the output contradict supplied evidence?'
            '- [ ] Are assumptions clearly identified?'
            ''
            '## 3. Completeness'
            ''
            '- [ ] Does the output cover every requested component?'
            '- [ ] Are important steps missing?'
            '- [ ] Are edge cases acknowledged?'
            '- [ ] Are limitations documented?'
            ''
            '## 4. Safety and Authorization'
            ''
            '- [ ] Does the output remain within the permitted scope?'
            '- [ ] Does it avoid unauthorized or irreversible actions?'
            '- [ ] Does it distinguish recommendations from execution?'
            '- [ ] Does it avoid claiming an action occurred without evidence?'
            ''
            '## 5. Quality'
            ''
            '- [ ] Is the writing clear?'
            '- [ ] Is the structure easy to follow?'
            '- [ ] Is unnecessary repetition removed?'
            '- [ ] Is the result usable without extensive correction?'
            ''
            '## 6. Final Classification'
            ''
            'Choose one:'
            ''
            '- PASS'
            '- PASS WITH OBSERVATIONS'
            '- REVISION REQUIRED'
            '- BLOCKED'
            '- INSUFFICIENT EVIDENCE'
            ''
            '## Reviewer Record'
            ''
            '| Field | Value |'
            '|---|---|'
            '| Task |  |'
            '| Evaluator |  |'
            '| Date |  |'
            '| Classification |  |'
            '| Evidence reviewed |  |'
            '| Primary findings |  |'
            '| Required corrections |  |'
            ''
            '[Return to profile](../README.md)'
        )

    # ------------------------------------------------------------
    # Sample 2: QA review example
    # ------------------------------------------------------------

    Write-Utf8File `
        -Path (Join-Path $SamplesPath "qa-review-example.md") `
        -Lines @(
            '# Quality Assurance Review Example'
            ''
            '## Task'
            ''
            'Evaluate whether a generated implementation report proves that an external provider request was executed successfully.'
            ''
            '## Submitted Claim'
            ''
            '> The integration was tested successfully and the provider returned a valid response.'
            ''
            '## Available Evidence'
            ''
            '| Evidence field | Recorded value |'
            '|---|---|'
            '| Preflight status | NOT_EXECUTED_WITH_BLOCKERS |'
            '| Execution authorized | false |'
            '| Provider call observed | false |'
            '| Paid calls | 0 |'
            '| Usage reported | none |'
            '| Receipt created | no |'
            ''
            '## Evaluation'
            ''
            'The submitted claim is not supported.'
            ''
            'The evidence shows that the request did not proceed beyond preflight evaluation. No provider call occurred, and no provider-generated receipt or usage record exists.'
            ''
            '## Corrected Statement'
            ''
            '> The integration preflight controls were evaluated successfully, but the external provider request was blocked and was not executed.'
            ''
            '## Classification'
            ''
            '**REVISION REQUIRED**'
            ''
            '## Reason'
            ''
            'The original statement incorrectly represented a blocked preflight result as successful external execution.'
            ''
            '## Required Corrections'
            ''
            '- Remove the claim that the provider responded'
            '- State that execution was blocked'
            '- Preserve valid preflight-control evidence'
            '- Do not claim live integration success without provider-side evidence'
            ''
            '[Return to profile](../README.md)'
        )

    # ------------------------------------------------------------
    # Sample 3: Structured task completion report
    # ------------------------------------------------------------

    Write-Utf8File `
        -Path (Join-Path $SamplesPath "structured-task-report.md") `
        -Lines @(
            '# Structured Task Completion Report'
            ''
            '## Task Identification'
            ''
            '| Field | Value |'
            '|---|---|'
            '| Task | Review and organize an AI-assisted repository release |'
            '| Operator | Aldo Israel Hernandez |'
            '| Execution mode | Written-instruction, asynchronous workflow |'
            ''
            '## Objective'
            ''
            'Verify that requested changes are present, validation checks pass, documentation is accurate, and the repository is ready for review.'
            ''
            '## Work Performed'
            ''
            '1. Reviewed the written objective and constraints'
            '2. Identified required files and acceptance criteria'
            '3. Inspected repository status'
            '4. Compared implementation outputs against requested behavior'
            '5. Ran available validation commands'
            '6. Documented failed or incomplete checks'
            '7. Corrected unsupported status claims'
            '8. Prepared a concise completion report'
            ''
            '## Acceptance Criteria'
            ''
            '- [x] Required files identified'
            '- [x] Repository state reviewed'
            '- [x] Validation output recorded'
            '- [x] Unsupported claims removed'
            '- [x] Limitations documented'
            '- [x] Final status assigned'
            ''
            '## Final Status'
            ''
            '**PASS WITH OBSERVATIONS**'
            ''
            '## Observations'
            ''
            '- Core requested artifacts were present'
            '- Validation completed successfully'
            '- One documentation statement required correction'
            '- No production-readiness claim was made'
            ''
            '## Escalation Boundary'
            ''
            'A technical maintainer should review future changes involving:'
            ''
            '- External execution'
            '- Credentials'
            '- Financial transactions'
            '- Destructive operations'
            '- Irreversible actions'
            ''
            '[Return to profile](../README.md)'
        )

    # ------------------------------------------------------------
    # Validate all six files
    # ------------------------------------------------------------

    $RequiredFiles = @(
        (Join-Path $CaseStudiesPath "aion-guard-lite.md"),
        (Join-Path $CaseStudiesPath "aion-proof-lab.md"),
        (Join-Path $CaseStudiesPath "aion-icli.md"),
        (Join-Path $SamplesPath "ai-evaluation-checklist.md"),
        (Join-Path $SamplesPath "qa-review-example.md"),
        (Join-Path $SamplesPath "structured-task-report.md")
    )

    foreach ($File in $RequiredFiles) {
        if (-not (Test-Path -LiteralPath $File)) {
            throw "Required portfolio document was not created: $File"
        }

        $Length = (Get-Item -LiteralPath $File).Length

        if ($Length -lt 250) {
            throw "Generated portfolio document appears incomplete: $File"
        }

        Write-Host "PASS: $File" -ForegroundColor Green
    }

    # ------------------------------------------------------------
    # Verify links referenced by README now resolve locally
    # ------------------------------------------------------------

    $ReadmePath = Join-Path $RepoPath "README.md"

    if (-not (Test-Path -LiteralPath $ReadmePath)) {
        throw "README.md is missing."
    }

    $Readme = Get-Content -LiteralPath $ReadmePath -Raw

    $ExpectedLinks = @(
        "./case-studies/aion-guard-lite.md",
        "./case-studies/aion-proof-lab.md",
        "./case-studies/aion-icli.md",
        "./samples/ai-evaluation-checklist.md",
        "./samples/qa-review-example.md",
        "./samples/structured-task-report.md"
    )

    foreach ($Link in $ExpectedLinks) {
        if ($Readme -notmatch [regex]::Escape($Link)) {
            throw "README does not reference expected file: $Link"
        }
    }

    Write-Host ""
    Write-Host "README portfolio links: PASS" -ForegroundColor Green
    Write-Host ""
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host " PART 5 RESULT: PASS" -ForegroundColor Green
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "No commit or push was performed." -ForegroundColor Yellow
}