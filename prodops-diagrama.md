# ProdOps — Diagrama Completo do Framework

Documento de referência visual. Não faz parte do livro publicado.

---

## 1. Fluxo principal

Do Business Signal ao Released, com modos, Gates e jornadas transversais.

```mermaid
graph TD

    %% ── ENTRADA ──────────────────────────────────────────────────────────────
    BS(["Business Signal"])
    BS --> ASSESS_P

    subgraph ASSESS["Assessment — governança informacional transversal"]
        direction LR
        ASSESS_P["Dimensão Prospectiva\nqualidade epistêmica do contexto\ndefine: Upstream necessário?"]
        ASSESS_R["Dimensão Retrospectiva\nextrai aprendizado de ciclos encerrados\nproduz novos Business Signals"]
    end

    ASSESS_P --> BI["Business Intent\nOBC: Draft"]
    BI --> ICE["Icebox\nOBC: Draft — pré-modo\nainda sem regime declarado"]

    %% ── UPSTREAM ─────────────────────────────────────────────────────────────
    subgraph UP["Upstream — rigor não bloqueante"]
        direction TB
        EXP["Experiment Plan\nIn Hypothesis → Evidence Running\nhipótese falsificável · critério de parada"]
        DP["Decision Package\nhipótese respondida\nincerteza residual declarada"]
        EXP --> DP
    end

    ICE -->|"incerteza alta\nabre experimento"| EXP
    ICE -->|"contexto suficiente\nsem exploração prévia"| CG

    DP --> CG

    %% ── COMMITMENT GATE ──────────────────────────────────────────────────────
    subgraph M1["Momento 1 — Commitment Gate"]
        CG{"Commitment Gate\nPM · Tech Lead · Autor\n6 outcomes canônicos"}
    end

    CG -->|"Promover\nou Promover com restrição\n(subconjunto aprovado)"| M2
    CG -->|"Requer outro\nexperimento"| EXP
    CG -->|"Aguardar decisão\nde negócio"| WAIT_N["Bloqueado\ndecisor identificado\ndata esperada registrada"]
    CG -->|"Aguardar\ndependência externa"| WAIT_D["Bloqueado\ndependência no Reliability Plan\ntrio reconvocado quando resolvida"]
    CG -->|"Descartar"| ARC["OBC: Archived\naprendizado em learnings.md\nexperimento encerrado"]

    %% ── MOMENTO 2 ────────────────────────────────────────────────────────────
    M2["Momento 2 — Artifact Promotion\nOBC: Draft → Refining\nWork Item entra em Discovery: Elaboration\nupstream-trail atualizado"]

    %% ── DOWNSTREAM ───────────────────────────────────────────────────────────
    subgraph DOWN["Downstream — rigor bloqueante"]
        direction TB
        DE["Discovery: Elaboration\nOBC: Refining\nBDD Feature · Observable Events\nReliability Plan quando exigido\nquestões abertas do DP resolvidas"]

        RG["Momento 3 — Readiness Gate\ndiligence-sync bloqueante\nOBC: Refining → Readiness\nBDD em artifacts/bdd/\nFindings: resolvidos ou com waiver"]

        DR["Downstream Ready\nOBC: Readiness\nIteration Plan criado\nPlanning executado"]

        DEL["Delivery\nBootstrap → Hack → Sync\nFinish → Ship → Validate → Promote\nOBC: In Delivery\nRelease Trail preenchido"]
    end

    M2 --> DE
    DE --> RG
    RG -->|"Finding aberto\nsem waiver"| DE
    RG -->|"Aprovado"| DR
    DR --> DEL

    %% ── REGRESSÃO ────────────────────────────────────────────────────────────
    DEL -->|"Regressão\nhipótese central invalidada\nou dependência bloqueante"| REG["OBC: In Delivery → Refining\ncompromisso suspenso\nregistro no Release Trail\nnovo experimento Upstream aberto"]
    REG -->|"redraft formal\nOBC: Refining → Draft"| ICE

    %% ── SAÍDA ────────────────────────────────────────────────────────────────
    DEL -->|"Promote concluído\nOBC: In Delivery → Released"| REL["OBC: Released\nProduct Capability em produção\nSLOs monitorados\nObservable Events ativos em runtime"]
    REL --> OP["Operation: Released\nRunbooks · SLOs · Incident Response\nmétricas de uso acompanhadas"]

    OP --> ASSESS_R
    ASSESS_R -->|"novos Business Signals"| BS2(["Business Signal\n(próximo ciclo)"])

    %% ── DILIGENCE ────────────────────────────────────────────────────────────
    subgraph DIL["Diligence — verificação contínua (transversal)"]
        direction LR
        DSYNC["diligence-sync\nevent-driven · bloqueante no Downstream\nKnowledge Space ↔ Execution Space"]
        DASYNC["diligence-async\nproativo · não bloqueante no Upstream\nverifica artefatos mínimos e trails"]
    end

    %% ── ESTILOS ──────────────────────────────────────────────────────────────
    classDef upstream    fill:#E0F2FE,stroke:#3B82F6,color:#1E3A5F
    classDef downstream  fill:#FEF3C7,stroke:#F59E0B,color:#78350F
    classDef gate        fill:#F3E8FF,stroke:#A855F7,color:#3B0764
    classDef moment2     fill:#EDE9FE,stroke:#7C3AED,color:#2E1065
    classDef released    fill:#D1FAE5,stroke:#10B981,color:#064E3B
    classDef blocked     fill:#FEE2E2,stroke:#EF4444,color:#7F1D1D
    classDef transversal fill:#F9FAFB,stroke:#9CA3AF,stroke-dasharray:4 4
    classDef signal      fill:#DBEAFE,stroke:#2563EB,color:#1E3A5F

    class EXP,DP upstream
    class DE,RG,DR,DEL downstream
    class M1,CG gate
    class M2 moment2
    class REL,OP released
    class WAIT_N,WAIT_D,ARC,REG blocked
    class ASSESS,DIL transversal
    class BS,BS2 signal
```

---

## 2. Ciclo de vida do OBC

Transições de estado do Observable Business Contract.

```mermaid
stateDiagram-v2
    direction LR

    [*] --> Draft : Business Signal → Business Intent

    Draft --> Refining : Commitment Gate\nPromover ou Promover com restrição\n(Momento 1)

    Refining --> Readiness : Readiness Gate aprovado\n(Momento 3)

    Readiness --> InDelivery : Bootstrap.Started

    InDelivery --> Released : Promote concluído

    Released --> Archived : Depreciação / substituição

    Draft --> Archived : Commitment Gate Descartar

    Readiness --> Refining : Regressão antes do Bootstrap

    InDelivery --> Refining : Regressão durante Delivery

    note right of Draft
        Icebox (pré-modo)
        Upstream: In Hypothesis
        Upstream: Experiment Plan
        Upstream: Evidence Running
    end note

    note right of Refining
        Discovery: Elaboration
        (pós-Momento 1, pré-Momento 3)
        — ou —
        Delivery: Refining
        (regressão; exige redraft → Draft
        antes de novo Commitment Gate)
    end note

    note right of Readiness
        Downstream Ready
        (pós-Momento 3)
    end note

    note right of InDelivery
        Delivery: Iteration Plan
        Bootstrap → Hack → Sync
        Finish → Ship → Validate → Promote
    end note

    note right of Released
        Operation: Released
        SLOs monitorados
        Observable Events ativos
    end note
```

---

## 3. Os três momentos

```mermaid
graph LR
    M1["Momento 1\nCommitment Gate\nPM · Tech Lead · Autor\nDecision Package avaliado\nDownstream Declared"]

    M2["Momento 2\nArtifact Promotion\nOBC: Draft → Refining\nWork Item: Discovery: Elaboration\nBDD movida para paths comprometidos"]

    M3["Momento 3\nReadiness Gate\ndiligence-sync bloqueante\nOBC: Refining → Readiness\nBDD em artifacts/bdd/\nDownstream Ready"]

    M1 -->|"outcome Promover\nou Promover com restrição"| M2
    M2 --> M3
    M3 -->|"Finding aberto"| BLOCK["Retorno à Discovery: Elaboration\nou Waiver formal pelo trio"]
    M3 -->|"Aprovado"| DEL["Delivery: Iteration Plan\nBootstrap.Started"]
```

---

## 4. Os seis outcomes do Commitment Gate

```mermaid
graph TD
    CG{"Commitment Gate\nPM · Tech Lead · Autor"}

    CG -->|"evidência justifica\no comprometimento"| P["Promover\nOBC: Draft → Refining\nDownstream Declared"]
    CG -->|"parte avança;\nresto continua em exploração"| PR["Promover com restrição\nsubconjunto → Downstream\nrestrição registrada no upstream-trail"]
    CG -->|"hipótese válida\nmas evidência insuficiente"| RE["Requer outro experimento\nnovo experimento com hipótese\nmais específica ou rota diferente"]
    CG -->|"decisão fora\ndo escopo do time"| ADN["Aguardar decisão de negócio\ndecisor identificado\ndata esperada registrada"]
    CG -->|"dependência técnica\nou de terceiro"| ADE["Aguardar dependência externa\nregistrada no Reliability Plan\ntrio reconvocado quando resolvida"]
    CG -->|"hipótese refutada\nou contexto mudou"| DES["Descartar\nOBC: Draft → Archived\naprendizado em learnings.md"]

    classDef green  fill:#D1FAE5,stroke:#10B981
    classDef yellow fill:#FEF3C7,stroke:#F59E0B
    classDef red    fill:#FEE2E2,stroke:#EF4444

    class P,PR green
    class RE,ADN,ADE yellow
    class DES red
```

---

## 5. As cinco jornadas e os dois modos

```mermaid
graph LR
    subgraph MODOS["Dois modos de execução"]
        direction TB
        USM["Upstream\nrigor não bloqueante\ncomprometimentos mínimos\nincerteza explícita e gerenciável"]
        DSM["Downstream\nrigor bloqueante\nGates verificáveis e obrigatórios\ncompromisso formal honrado com evidência"]
    end

    subgraph JORNADAS["Cinco jornadas (operam em qualquer modo)"]
        direction TB
        JD["Discovery\nreduz incerteza (Upstream)\nsatisfaz condições (Downstream)"]
        JDL["Delivery\nconstrução e entrega\nBootstrap → Promote"]
        JO["Operation\noperação e evolução em produção\nSLOs · runbooks · postmortems"]
        JA["Assessment\ntransversal\ngovernança informacional do ciclo"]
        JDI["Diligence\ntransversal\nKnowledge Space ↔ Execution Space"]
    end

    USM --- JD
    USM --- JDL
    USM --- JO
    DSM --- JD
    DSM --- JDL
    DSM --- JO

    classDef transversal fill:#F9FAFB,stroke:#9CA3AF,stroke-dasharray:4 4
    class JA,JDI transversal
```

---

## 6. Legenda

| Cor / estilo | Representa |
|---|---|
| Azul claro | Upstream (rigor não bloqueante) |
| Amarelo claro | Downstream (rigor bloqueante) |
| Roxo claro | Gates e Moments |
| Verde claro | Estados finais (Released, Operation) |
| Vermelho claro | Bloqueios, regressão, descarte |
| Tracejado cinza | Jornadas transversais (Assessment, Diligence) |
