# Chapter 10: Magazine Siará as Evidence

---

## The living laboratory

Magazine Siará is a Brazilian multi-tenant e-commerce company — fictional, but built with the texture of a real company. Its payments team operates the Payments API: a platform that decouples internal systems (Checkout, Order Management) from the external PSP (Asaas) and serves as the System of Record for all payment events. As a product, the Payments API was built entirely under the ProdOps framework from day one. As a laboratory, it is the most documented case available of a real system operating both modes — Upstream and Downstream — with verifiable evidence at each transition.

This coincidence is not accidental. ProdOps, as a framework, needs to be tested in real conditions to generate evidence that it works. The Payments API, as a product, needed a working framework that would make the construction process explicit enough to be examined and improved. Both needed each other.

What makes the Magazine Siará laboratory different from a retrospective case study is that the artifact corpus was produced *during* the work, not documented afterward. The upstream-trails record what was discovered session by session. The OBCs show the real state of commitment at each date. The Release Trails document how each phase was honored. What this chapter examines is what this corpus demonstrates about the framework — and what it has not yet demonstrated.

![Magazine Siará corpus: dependency graph between experiments, committed OBCs, and Downstream iterations](../images/cap10-experiments-corpus.svg)
*Figure 10. The Magazine Siará corpus as a dependency graph: 17 Upstream experiments, 12+ Committed OBCs, 15+ Downstream iterations with Release Trail.*

---

## Upstream as disciplined exploration

The Payments API's exploratory work began with a high-risk question: how should the API support the complete credit card lifecycle without crossing the PCI boundary or coupling Checkout to Asaas's contract?

This question had no obvious answer. Credit card is not a single flow: it is at least three distinct product options — hosted entry (lower PCI risk), saved card reuse (better UX, requires token storage decisions), and transparent new card entry (highest control, highest compliance responsibility). Each option implied decisions outside the Payments team's scope: PCI scope approved by Security, token model decided by Architecture, UX defined with the Checkout team.

EXP-001 was the first experiment. It produced no production code. It produced a Decision Package with a precise recommendation: only hosted entry advances to Downstream. The rest remains in Upstream awaiting external decisions. EXP-002 mapped the Asaas sandbox capabilities and limitations and confirmed the Validation Workbench as the simulation environment for scenarios the sandbox cannot reproduce deterministically — full provider scenario validation remains open, pending external evidence from Asaas. EXP-003 systematically compared the three integration models — hosted, tokenized, transparent — and answered its central hypothesis: hosted is the first slice. Tokenized remains in Upstream awaiting Security and Checkout decisions. Direct Capture is out of scope for the first slice.

Three sequential experiments. No production code written during any of them. The credit card feature entered Downstream only when there was sufficient evidence to commit the capability safely — and only the fraction that evidence supported.

This is Upstream as serious exploration engineering. Not a low-discipline phase before the "real" engineering. A structured effort of uncertainty reduction that produced verifiable knowledge — and a Decision Package that made the CommitmentGate possible.

---

## Direct Downstream: when the Signal is sufficient for the CommitmentGate

The Payments API corpus records a different case. Business Signal BS-001, registered on 2026-08-04, describes a problem with immediate pressure: Magazine Siará customers cannot split a single purchase across multiple payment methods, generating cart abandonment and lost contracts. The deadline: a partner supplier launch in up to 15 days, non-negotiable.

PM Eugenio assessed the situation and made a decision that is documented in PI-001:

> *"Execution mode: Downstream — there is sufficient clarity about what to build; the 15-day deadline does not allow for Upstream exploration. OBC and BDD must be written immediately."*

The justification is also documented: demand confirmed through two independent channels (end customers and sales team), scope bounded (Pix + Boleto), product owner identified, non-negotiable deadline, open questions are of the refinement type — they do not block the start.

The Split Payment OBC was committed on the same day. The open questions in PI-001 — minimum and maximum amount per payment method, limit of payment methods per purchase, policy for expired Boleto with Pix already paid — were treated as refinement, not as uncertainty that would block the CommitmentGate. Risk RISK-SP-001 (Boleto expiry policy) was closed by PM Eugenio on the same day with an explicit decision: maintain pending state, manual investigation by operations, no automatic cancellation or Pix reversal.

This case demonstrates something that EXP-001/002/003 did not: the CommitmentGate is not a ritual concluding exploration. It is a decision about the destiny of the capability. When demand is confirmed, the scope is bounded, and the deadline is non-negotiable, the CommitmentGate can be executed on the same day as the Business Signal — and this is not a shortcut. It is the correct calibration of rigor to the type of commitment being assumed.

What PI-001 names as "without Upstream" is precise: there were no pre-CommitmentGate experiments. But there was no absence of discovery. After the CommitmentGate, the Split Payment traversed the Discovery journey in Downstream mode: the OBC transitioned to Refining, the six Observable Events with mandatory dimensions were defined, the BDD Feature was written before any production code, the open questions from PI-001 were resolved with dated decisions (RISK-SP-001 closed by PM Eugenio with an explicit decision on the expired Boleto policy). The Readiness Gate verified that these conditions were met before authorizing entry into Delivery. Planning generated the Iteration Plan. Only then did Bootstrap, the first phase of Delivery, begin.

"Direct Downstream" does not mean discovery absent. It means discovery under commitment — in the Discovery journey executed in Downstream mode, with blocking rigor and Readiness Gate — rather than discovery before commitment, in Upstream mode.

The feature was delivered in iteration v0.14.0 (DS-61), within the deadline.

---

## Upstream parallel to Downstream: the EXP-007 case

The Magazine Siará corpus records a pattern that the linear Upstream → Downstream narrative does not capture. During the Downstream execution for Split Payment — post-CommitmentGate of BS-001, with DS-61 in progress — the team opened a parallel Upstream experiment: EXP-007.

EXP-007 investigated questions that the speed of the BS-001 CommitmentGate had not resolved in depth: the priority combinations of payment methods (Pix + Boleto, Pix + Card), the adequate domain model for composition, the business events needed to track each combination, and the partial failure policy — what happens when one payment method fails while the other has already been confirmed. The Draft OBC for `payment-composition` was produced during the experiment.

What makes this case rich as evidence is not the exception it represents: it is the operational normality it demonstrates. Downstream and Upstream coexisting for the same product at the same time. The Downstream maintained the delivery commitment (DS-61 within the deadline). The Upstream enriched the model with exploration rigor. When EXP-007 concluded, the learning — including code produced during exploration — was promoted and integrated into the ongoing Downstream.

This is what ProdOps names as mode coexistence: two commitment regimes operating in parallel for distinct work objects. Not sequence. Not alternation. Coexistence.

---

## Downstream in operation: 15 iterations with Release Trail

What the Magazine Siará corpus demonstrates that no purely theoretical case study can is the Downstream cycle in sustained operation. Not one iteration. Fifteen versioned iterations, from v0.2.0 to v0.15.0, each with a formal plan, Committed OBC, BDD Feature, and Release Trail with real entries from each phase.

The 12 committed OBCs in the corpus cover capabilities ranging from the product core (Pix invoice creation, payment confirmation via webhook, invoice cancellation) to platform capabilities (Datadog observability, DynamoDB optimization, production CI/CD pipeline). Each OBC has Observable Events with mandatory dimensions, Initial SLIs with numeric targets, Reliability Rules, and explicit decisions recorded with date and responsible party.

The `create-invoice` OBC documents the idempotency requirement with precise semantics: the same key returns the same result, retries do not create duplicate charges. The `payment-confirmation` OBC documents the Asaas webhook correlation strategy by `providerPaymentId` or `externalReference`, with the `payment.confirmation.unmatched` event emitted when the webhook arrives without a matching invoice — observability of the failure case, not only the happy path.

The `split-payment-pix-boleto` OBC is the richest: six Observable Events with mandatory dimensions, five Initial SLIs (three at 100%, two at 99%), six Reliability Rules including the explicit rule about expired Boleto with Pix already paid, and four decisions documented with date and responsible party. The `splitPaymentId` is traceable in all logs. Financial data never appears in public error responses.

These are not proposed contracts. They are contracts operating in production, with evidence that the promised behavior can be verified at runtime.

---

## Diligence in real numbers

EXP-014 tested a specific hypothesis: can the ProdOps Runtime automatically track the Delivery state of each Feature via CloudEvents, with Diligence capturing and attaching operational evidence to the same Work Item in real time — keeping GitHub Project and Datadog synchronized?

The result was **53/53 PASS**.

The 53 checks covered: CloudEvents emission for each Delivery cycle phase (Bootstrap.Started, Bootstrap.Completed, Hack.Started, etc.), GitHub Project status synchronization, Datadog metric recording, Diligence behavior when detecting divergence between Knowledge Space and Execution Space, and the formal waiver protocol for Findings that cannot be resolved immediately.

This result has a direct consequence for the framework: Diligence is not a periodic human audit process. It is an event-driven system that verifies, at the moment of the event, whether the system state satisfies the criteria necessary to advance. EXP-014 demonstrates this empirically, with 53 verifiable checks.

---

## Agents as event producers: EXP-015

EXP-015 tested whether Delivery Skills can act as producers of operational events via a canonical CloudEvents 1.0 contract, regardless of which AI agent is executing the skill.

The conformance suite ran 22 scenarios across 3 players (claude, codex, copilot). The result: **22/22 × 3 players — 100% conformance. Zero semantic divergences.**

What this demonstrates: when an explicit contract exists (the `prodops_emit_event` tool with the event catalog and emission rules), agents from different origins produce the same output. Interchangeability is not a property of agents; it is a property of the contract. An agent without an explicit contract diverges. An agent with an explicit contract converges — regardless of which agent it is.

An honesty note recorded in the EXP-015 report: the Codex and Copilot agents were not directly invoked in this validation. Conformance was verified by running the player-neutral tool with the corresponding player IDs. The suite validates the interface contract, not the direct behavior of the external agents. This record is itself an example of what a well-conducted Upstream produces: not just conclusions, but conclusions with a declared degree of confidence.

---

## The framework as a product of itself

The Magazine Siará corpus records an unusual situation: the repository operates simultaneously as a consumer product of the ProdOps Framework and as the canonical source of the same framework. The `framework-lock.yaml` documents this with `status: self`.

ProdOps Framework v1.14.0 was extracted from the repository as a distributable installable via a one-liner bash command in any repo. The extraction was not planned before development began: it emerged from real delivery practice. Framework version 1.0.0 was the first version without product-specific artifact leakage. Versions 1.1.0 through 1.14.0 document the maturation: a 47-event catalog, installation script, setup scripts, automatic generation of AGENTS.md and CLAUDE.md for consumers, Datadog dashboard templates, framework governance files.

This result inverts the conventional order: the framework did not precede the product. It emerged from the product. This is the most direct demonstration of what the book argues about Upstream: disciplined exploration is not a low-seriousness phase. When conducted with evidence rigor, it can produce artifacts that become infrastructure for other products.

---

## What the corpus has not yet demonstrated

Intellectual honesty requires specifying what the current repository does not demonstrate.

**The CommitmentGate with a fully independent human trio.** The CommitmentGates documented in the corpus have the PM as the named business decision-maker, but the figure of the independent "Author" — the engineer who did not conduct the experiment and verifies whether the Decision Package is legible without additional verbal context — does not appear recorded with a distinct identity. The mechanism works; the full separation of three roles as three independent physical persons still needs to be documented in a real case.

**The Perpetual Discovery diagnostic signals (S1-S4) applied prospectively.** The signals were defined as detectable without subjective judgment. EXP-014 demonstrated that Diligence can track the Execution Space in real time. But the instrumentation that would proactively detect Perpetual Discovery — monitoring TTE, Decision Latency, and Discovery WIP — is still a proposal, not implemented as automatic collection.

**The Downstream → Upstream regression protocol in a real case.** No item from the 15 documented iterations needed to regress. The protocol is defined and is in the framework; its operational validity in a real divergence case still needs empirical evidence.

---

## What the corpus demonstrates about the book's thesis

The central thesis is that Upstream and Downstream are execution modes that configure the type of commitment, not phases of a sequential process.

The Magazine Siará corpus supports this thesis in four distinct ways.

**First:** EXP-001/002/003 demonstrates that the same type of work — high-rigor technical analysis, contract mapping, integration model exploration — can be executed in Upstream mode without producing a delivery commitment, even when the work has technical quality that could go to production. This proves that the mode distinction is not a quality distinction. It is a commitment distinction.

**Second:** BS-001/PI-001/Split Payment demonstrates that the CommitmentGate does not require prior exploration. When demand is confirmed and scope is bounded, the CommitmentGate is executed on the same day — and this is correct. The framework does not impose exploration where exploration is not necessary. It requires that the mode decision be explicit and justified.

**Third:** the 53/53 from EXP-014 and the 22/22 × 3 players from EXP-015 demonstrate that the mode problem affects not only human teams, but any agency system operating with artifact-provided guidance. When the contract is explicit (OBC with Observable Events, tool with canonical catalog), agents converge. When the contract is absent or inconsistent, agents diverge. The solution is to make the contract verifiable in the artifacts themselves — not to enumerate it.

**Fourth:** `status: self` demonstrates that Upstream does not only produce features. When conducted with evidence rigor and declared falsification criteria, it can produce replicable infrastructure — ProdOps Framework v1.14.0 installable in any repository.

---

## The next territory

What the Magazine Siará corpus has not yet documented is the complete lifecycle of an OBC that is born with the Business Intent (from the Business Signal), traverses Upstream, crosses the CommitmentGate with a full human trio, enters Downstream with a Committed OBC and formalized BDD Feature, is delivered with a complete Release Trail, and reaches the Operational state with measured SLOs and a documented postmortem.

This cycle exists in parts — some OBCs are already Operational; CommitmentGates have been executed but without the fully recorded trio; Release Trails exist but without the cycle traced all the way back to the original Business Signal. The complete composition in a single case traceable end-to-end is the territory that lies ahead.

When that cycle is documented with the same level of rigor with which the 17 experiments documented Upstream, the framework will have taken the step that transforms a coherent theory with extensive evidence into a method with complete traceability from intent to outcome.

---

*Chapter 10 of 10 | Part VI: The Laboratory*
