# Chapter 4: Upstream: the mode of explicit uncertainty

---

## The discipline of what is not a promise

![Upstream experiment lifecycle](../images/cap04-experiment-lifecycle.svg)
*Figure 4. Upstream experiment lifecycle: from HypothesisFormed to CommitmentGate with its 6 outcomes*

Upstream is not the mode where rigor is discarded. It is the mode where rigor takes a distinct form: oriented toward the quality of evidence, not toward verifying a delivery commitment.

What defines Upstream is not the absence of commitment, but the type of commitment that is in effect. There are three layers in this distinction that must be kept separate.

Work in progress carries a real commitment. The investigation has a hypothesis, responsible parties, and some stopping criterion, even if implicit. Conducting an experiment without rigor, without a formulated hypothesis, without verifiable progression, is not Upstream well executed; it is Upstream poorly conducted.

There is, however, no formal commitment to a specific capability: no OBC Committed, no Release Trail, no promise that that behavior will be in production for those users, with those acceptance criteria.

And there is no blocking commitment: changing direction, closing the experiment, or rejecting the hypothesis does not violate a contract that needs to be renegotiated. The cost of reversal remains controllable because the prevailing regime does not transform a change of course into a broken promise.

Software produced in Upstream can have production quality: tested, documented, and deployable code. What distinguishes this work from Downstream is not the technical quality of the artifact, but the commitment regime under which it was produced.

The discipline of Upstream is the discipline of keeping these three layers distinct. A team can work with all the technical rigor of a senior engineer in Upstream mode and the work still remains non-blocking, because the capability commitment has not been made.

---

## When to open an experiment

When Upstream operates in the Discovery journey, the most structured working instrument is the experiment. An experiment is not just any informal investigation: it is a structured artifact with a defined purpose, a falsifiable hypothesis, and a stopping criterion.

The ProdOps framework guides four conditions to justify opening a formal experiment. All must be true: there is a falsifiable hypothesis; the hypothesis has not yet been answered by existing evidence; the answer has decision value — it affects what will be built or how; and the cost of assuming the hypothesis as true without testing it exceeds the cost of the experiment.

These conditions eliminate two frequent cases of inappropriate experiment use. The first: investigating what is already known. The hypothesis has already been answered by previous experiments or by the team's accumulated knowledge, and formalizing a new experiment is unnecessary work. The second: formalizing an untestable preference. The hypothesis is not falsifiable because it is a belief or a design orientation with no verification criterion.

> **Note:** The distinction between informal research and formal experiment is operational, not canonical. The framework does not require that every investigation be a formal experiment, only that formal experiments satisfy these conditions.

EXP-001 of the Magazine Siará Payments API is a concrete example. The central hypothesis: "the complete credit card lifecycle can be supported without crossing the PCI boundary, provided only the hosted flow is exposed in the first iteration." The hypothesis is falsifiable: if the PCI scope analysis shows that hosted and tokenized have equivalent exposure, or if the Checkout team cannot integrate the hosted flow without breaking changes to the existing contract, the hypothesis is refuted. The answer has decision value: it defines which of the three integration models — hosted, tokenized, transparent — enters Downstream first. And the cost of assuming the hypothesis without testing it would be to build with the wrong model and need a second Downstream delivery to correct it.

---

## The anatomy of the experiment

Every Upstream experiment has two mandatory artifacts: `experiment.md` and `upstream-trail.md`.

The `experiment.md` documents the permanent structure of the experiment: Business Goal, Questions to Answer, Hypothesis, Repository Scope Gate, Findings, and Decision Package.

```mermaid
graph TD
    EXP["experiment.md"] --> BG["Business Goal"]
    EXP --> HYP["Hypothesis + Evidence Threshold"]
    EXP --> QA["Questions to Answer"]
    EXP --> SC["Scope"]
    EXP --> DP["Decision Package"]
    EXP --> EC["Exit Criteria"]
    DP --> ES["Executive Summary"]
    DP --> REC["Recommended Decision"]
    DP --> RISK["Risks"]
    DP --> OPP["Opportunities"]
    DP --> DS["Downstream Scope"]
``` It is not a bureaucracy template: it is the mechanism that keeps the experiment oriented toward its central hypothesis. The Decision Package section is what determines whether the experiment is mature enough for the CommitmentGate.

The `upstream-trail.md` is the chronological log of sessions: what was done, what was discovered, which artifacts were produced, which decisions were made and why. It serves two purposes. During the experiment, it is the mechanism that prevents context loss between sessions. At the CommitmentGate, it is the evidence that the experiment had real progression, not merely accumulated entries without advancing the hypothesis.

Beyond the mandatory artifacts, experiments can have optional artifacts: OBC Draft (mandatory before the CommitmentGate, not before), BDD Feature in draft, evidence files in `evidence/`, prototypes in `prototypes/`. The key is that these artifacts are created as the experiment needs them, not as an entry requirement.

---

## Evidence Threshold: the criterion that Upstream may or may not declare

The Evidence Threshold is the explicit criterion that defines when the evidence produced is sufficient to make a commitment decision.

In Upstream, the Evidence Threshold is *optional* (recommended, but not mandatory). If declared, revisions to the threshold must be recorded in the upstream-trail. If not declared, the stopping criterion is the author's judgment: the investigation questions have been answered, the Decision Package can be written with substance, and the residual uncertainty is declarable and acceptable.

What is not acceptable is the total absence of a stopping criterion — and it is precisely this absence that produces the main anti-pattern of Upstream.

---

## Perpetual Discovery: the central anti-pattern

Perpetual Discovery is the state of an experiment that continues accumulating evidence and sessions without the central hypothesis advancing toward a commitment decision. The experiment never reaches the CommitmentGate, not because the evidence is insufficient, but because there is no pressure or explicit criterion forcing the decision.

Three structural conditions produce Perpetual Discovery. The absence of a declared Evidence Threshold: without a stopping criterion, the experiment can always "need more evidence" — the implicit threshold is infinite. The central hypothesis never formalized: without something to falsify, there is never an answer — the experiment continues because the question remains open. And the CommitmentGate seen as an approval event rather than a commitment decision: if the gate is perceived as the moment when the ability to change course ends, there is a rational incentive to avoid it.

The ProdOps framework identifies four diagnostic signals that make Perpetual Discovery recognizable without relying on subjective judgment. The numerical thresholds below are guiding heuristics, not canonized criteria. What is invariant is the structure of the diagnosis; what each team calibrates is the threshold:

**S1: No progression in the upstream-trail for 3+ sessions.** If the trail has entries but the Hypothesis section of experiment.md has not changed in more than 2 weeks and the Decision Package still has no substance, the experiment is stagnant.

**S2: Questions to Answer with status "not answerable with available evidence".** If some question was marked as unanswerable without the central hypothesis having been answered by another route, and this state persists for more than 5 days without substitute evidence, the experiment is blocked.

**S3: Evidence Threshold declared and not reachable without a new hypothesis.** If the threshold was declared and the accumulated evidence does not satisfy it after 3 or more collection sessions, without identification of new sources, the current route will not lead to the threshold.

**S4: Stakeholder with a decision blocked for 10+ business days by this experiment.** The cost of waiting exceeds the value of continued exploration: the decision to advance or close must be made.

When multiple signals are active simultaneously, the experiment is at critical risk of Perpetual Discovery and the CommitmentGate must be convened — not to approve, but to decide what to do.

```mermaid
graph TD
    S1["S1: upstream-trail with no progress for 3+ sessions"]
    S2["S2: Questions to Answer unanswerable for 5+ days"]
    S3["S3: Evidence Threshold declared but not reachable"]
    S4["S4: Stakeholder blocked for 10+ business days"]
    S1 & S2 & S3 & S4 --> PD["Perpetual Discovery diagnosed"]
    PD --> |"correct outcome"| CG["Immediate CommitmentGate"]
    CG --> D["Discard with learning\nor Requires another experiment"]
```

---

## The three acts of deployment

A point that deserves explicit attention: Upstream does not prohibit code in production. The mode describes the type of commitment, not where code can be deployed.

There are three distinct acts of deployment in Upstream, with different authorizations and consequences:

**Sandbox Deploy**: code deployed in an ephemeral and isolated stack, without real client traffic. The engineer decides. The stack is destroyed at the end of the experiment. No Release Trail, no OBC Committed.

**Controlled Production**: Upstream code deployed to real production, without CommitmentGate. Explicit authorization from the team and leadership. Immediate rollback available. No Release Trail required. This is not a violation of Upstream mode: it is an authorized act. What distinguishes it from promotion is that the *capability commitment* (OBC Committed, Downstream gates) has not been made. The code reaches production; the capability remains under exploration.

**Capability Promotion**: CommitmentGate with Promote outcome. BDD Feature and OBC moved to committed paths. The item enters the Iteration Plan. Downstream begins.

The distinction between Controlled Production and Capability Promotion is precisely the distinction the modal model resolves: in the first case, the code is in production but the capability is not committed; in the second, the commitment has been formally made with all its gates.

---

## Upstream in operation: Magazine Siará as exemplar

The first three experiments of the Magazine Siará Payments API (EXP-001, EXP-002, and EXP-003) illustrate Upstream as an operational mode in its most complete form, with the CommitmentGate executed at the end of the sequence.

EXP-001 opened with a high-risk question: how to support the complete credit card lifecycle without crossing the PCI boundary or coupling Checkout to the Asaas contract? Before writing a single line of production code, the experiment specified the mandatory BDD scenarios, the Observable Events expected for each flow (authorization, confirmation, risk analysis, refusal, cancellation, chargeback), and the dimensions that could never appear in logs (card number, CVV, provider token). EXP-002 mapped the Asaas sandbox capabilities and limitations for reproducing the credit card cycle, and confirmed the Validation Workbench as the simulation environment for scenarios the sandbox cannot reproduce deterministically — full provider scenario validation remains open, pending external evidence from Asaas. EXP-003 systematically compared the three possible integration models — hosted, tokenized, transparent — and produced the recommendation with justification: only hosted entry advances to Downstream, because it is the only option that does not require decisions external to the Payments team.

The EXP-003 Decision Package recommends Promote with restriction (outcome ②): the hosted slice advances; the remaining options remain in Upstream awaiting third-party decisions (PCI scope, token model, Checkout UX). The CommitmentGate was executed with this Decision Package: the trio recorded the outcome, and Downstream began exclusively for hosted entry.

Three sequential experiments. No production code during any of them. A recommendation verifiable by third parties. A CommitmentGate that decided the capability's fate with sufficient evidence — and with an explicit restriction on what the evidence did not support. This is Upstream as serious exploration engineering.

---

## What Upstream is not responsible for doing

The definition of Upstream includes an explicit list of what is outside its scope. Implementing the committed capability with blocking gates: that is the Delivery journey in Downstream mode. The distinction is one of commitment, not physical activity: Upstream can produce functional code, proof of concept, implementation in sandbox or in controlled production, without that constituting the delivery of a formally promised capability. Defining how observability will be implemented technically: that is the responsibility of Downstream (the "how" of instrumentation, not the "what" that must be observable). Producing OBC Committed: that is Discovery in Downstream. Producing complete BDD in `prodops/artifacts/bdd/`: that happens before the Readiness Gate. Guaranteeing the absence of uncertainty: acceptable residual uncertainty is a valid CommitmentGate criterion.

This last statement is counterintuitive enough to deserve emphasis: Upstream does not need to eliminate all uncertainty. It needs to reduce uncertainty to the point where the residual risk is acceptable for taking on the Downstream commitment. What is "acceptable" is the collective judgment of the trio at the CommitmentGate, not a zero-uncertainty criterion that no finite experiment can satisfy.

Special attention is due to the item "Producing Committed OBC: that is Discovery in Downstream." It resolves a frequent misunderstanding: a Business Signal that enters directly into Downstream without prior Upstream does not skip discovery. The discovery happens in the Discovery journey executed in Downstream mode — with blocking rigor. The OBC transitions from Draft to Refining. The BDD Feature is written and refined. The Business Intent questions are resolved with dated decisions and identified responsible parties. The Readiness Gate blocks entry into the Delivery journey until these conditions are met. Only then — with the Iteration Plan generated in Planning — does Bootstrap, the first phase of Delivery, begin. What "without Upstream" describes is the absence of pre-CommitmentGate exploration. What happens after the CommitmentGate, in the Discovery journey in Downstream mode, is real discovery: with blocking gates that do not allow advancing until the conditions are satisfied.

---

*Chapter 4 of 10 | Part II: The Modes*
