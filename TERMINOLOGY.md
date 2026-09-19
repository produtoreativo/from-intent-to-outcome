# Terminologia canônica — ProdOps / From Intent To Outcome

Os termos abaixo têm definição precisa no livro. Variações são inconsistências editoriais.

---

## Tabela de termos e variações a evitar

| Termo canônico | Variações a evitar |
|---|---|
| Upstream / Downstream | "fase de discovery" / "fase de delivery" |
| modo de execução | "fase", "etapa", "estágio" |
| rigor de compromisso | "rigor de entrega", "regime orientado à entrega" |
| Commitment Gate | gate de comprometimento, portão |
| OBC (Observable Business Contract) | OKR, épico, item, "Outcome-Based Commitment" |
| estados do OBC: Draft → Refining → Readiness → In Delivery → Released → Archived | qualquer outra sequência |
| outcomes do Gate: Promover / Promover com restrição / Requer outro experimento / Aguardar decisão de negócio / Aguardar dependência externa / Descartar | grafias alternativas ("Requerer", etc.) |
| jornadas: Discovery, Delivery, Operation, Assessment, Diligence | grafias em português |
| Origin Streams: Business, Enterprise, Team, Technology | |
| sequência Delivery: Bootstrap → Hack → Sync → Finish → Ship → Validate → Promote | |

---

## Glossário completo

### Modo de execução (Upstream / Downstream)
**Categoria:** Conceito estruturante  
**Definição:** Configuração de compromisso que se aplica sobre qualquer jornada de produto. O modo define o rigor, não as jornadas: as mesmas cinco jornadas (Discovery, Delivery, Operation, Assessment, Diligence) existem nos dois modos; o que muda é o tipo de compromisso que o trabalho carrega. O modo não é uma fase, classificação de maturidade, tipo de trabalho nem posição temporal. É uma configuração de compromisso verificável a qualquer momento. O que determina a transição entre modos é uma decisão explícita formalizada no Commitment Gate, não uma passagem de tempo.  
**Capítulo:** Cap 3 (definição canônica); Cap 2 (distinção vs. interpretação sequencial)

---

### Upstream
**Categoria:** Modo de execução  
**Definição:** Modo de execução em que o rigor é não bloqueante: práticas, artefatos e evidências estão disponíveis e recomendados, mas não constituem condições obrigatórias para avançar. O time pode comprometer-se com uma investigação ou com a produção de determinada evidência; o que não existe é um compromisso bloqueante cujo não-cumprimento impede o avanço. Não implica ausência de rigor: o rigor está orientado à qualidade da evidência. O software produzido pode ter qualidade de produção; o que distingue o trabalho do Downstream não é a qualidade técnica do artefato, mas o regime de compromisso. Upstream não é sinônimo de jornada Discovery.  
**Capítulo:** Cap 3 (definição canônica); Cap 5 (operacionalização)

---

### Downstream
**Categoria:** Modo de execução  
**Definição:** Modo de execução em que o rigor é bloqueante: Gates são verificáveis e precisam ser satisfeitos antes de avançar, artefatos precisam estar em estados definidos e a sequência de etapas é imposta. Um item em modo Downstream não prossegue com lacunas a resolver depois: o trabalho para até que as condições obrigatórias sejam atendidas. Começa quando o Commitment Gate é executado com o outcome Promover. Não é sinônimo de jornada Delivery. Downstream não implica ausência de discovery.  
**Capítulo:** Cap 3 (definição canônica); Cap 6 (operacionalização)

---

### Rigor de compromisso
**Categoria:** Regime de rigor  
**Definição:** Regime de rigor orientado à verificação da realização, à preservação do compromisso, ao controle de mudança e à evidência do resultado. Aplica-se no modo Downstream. O custo de estar errado dentro de um compromisso é radicalmente mais alto: uma premissa incorreta exige retrabalho, renegociação e eventualmente atraso de entrega. Quando se aplica rigor de compromisso durante exploração (Upstream), o resultado é bloqueio prematuro do aprendizado.  
**Capítulo:** Cap 1 (introdução); Cap 3

---

### Rigor de exploração
**Categoria:** Regime de rigor  
**Definição:** Regime de rigor orientado à qualidade da evidência, ao aprendizado e à redução da incerteza relevante. Aplica-se no modo Upstream. Quando se aplica rigor de exploração dentro de um compromisso formal (Downstream), a execução perde a estrutura necessária para honrá-lo.  
**Capítulo:** Cap 1

---

### Rigor bloqueante
**Categoria:** Regime de rigor  
**Definição:** Característica do modo Downstream: Gates obrigatórios devem ser satisfeitos antes de avançar. Se uma condição não for satisfeita, o trabalho para. Não existe "vamos resolver depois": cada Gate existe porque o compromisso precisa ser honrado com evidência.  
**Capítulo:** Cap 3

---

### Rigor não bloqueante
**Categoria:** Regime de rigor  
**Definição:** Característica do modo Upstream: práticas e artefatos estão disponíveis e recomendados, mas não são condições obrigatórias de avanço. Um trabalho mal conduzido no Upstream é um problema, mas o custo de corrigir permanece controlável porque o regime vigente não torna a mudança de direção a violação de um compromisso bloqueante.  
**Capítulo:** Cap 3

---

### Coexistência de modos
**Categoria:** Conceito  
**Definição:** Estado operacional em que o mesmo time opera simultaneamente em diferentes modos para diferentes objetos de trabalho. Uma Product Capability comprometida pode estar em Downstream com Gates ativos, enquanto uma hipótese relacionada está em Upstream sob regime não bloqueante. Os dois modos coexistem porque representam diferentes regimes de compromisso, não diferentes momentos do tempo. O EXP-007 da Magazine Siará (Upstream paralelo ao DS-61 em Downstream) é o caso exemplar no corpus.  
**Capítulo:** Cap 3, Cap 11 (EXP-007)

---

### Discovery no Downstream
**Categoria:** Anti-padrão (distinção conceitual)  
**Definição:** Exploração realizada depois que uma decisão passou a carregar um compromisso operacional, econômico ou temporal. O problema não é descobrir depois do comprometimento: é carregar incerteza para dentro de um compromisso sem reconhecer que o custo de estar errado mudou. É estruturalmente arriscado porque incentiva ocultar problemas até que sejam graves demais.  
**Capítulo:** Cap 2

---

## Artefatos

### OBC (Observable Business Contract)
**Categoria:** Artefato  
**Definição:** Artefato que torna o compromisso de uma Product Capability observável e auditável ao longo de todo o ciclo de vida. Nasce na transição de um Business Signal para um Business Intent e sempre existe a partir desse momento. O modo determina sob qual regime o OBC opera, não quando ele nasce. Contém: Business Goal, Hypothesis, Observable Events (com dimensões obrigatórias), Initial SLIs (com targets numéricos), Reliability Rules, acceptance criteria verificáveis e métricas de sucesso com baseline e target. Não é um SLA técnico: é a declaração de que o contrato de negócio tem dimensões mensuráveis verificáveis em runtime.  
**Capítulo:** Cap 3 (introdução e ciclo de vida completo); Cap 8 (papel epistêmico)

---

### Business Signal
**Categoria:** Artefato  
**Definição:** Ponto de entrada do ciclo de vida de uma Product Capability. Observação, qualitativa ou quantitativa, que indica que pode existir uma oportunidade ou problema que justifica atenção. Carrega exatamente um Origin Stream. Pode entrar no Portfolio Tracking List (fluxo global, escopo amplo, multi-produto) ou na Product Tracking List (fluxo local, produto único). A avaliação do Business Signal é o primeiro trabalho do Assessment prospectivo.  
**Capítulo:** Cap 4 (definição e fluxo); Cap 3 (fluxo no PIB)

---

### Business Intent
**Categoria:** Artefato  
**Definição:** Resultado da transformação de um Business Signal em intenção formal de exploração ou execução. A partir da Business Intent, o OBC Draft sempre existe. Define o escopo de exploração ou compromisso e é o input para a criação do item no PIB ou no BIB.  
**Capítulo:** Cap 4; Cap 3

---

### Product Capability
**Categoria:** Artefato (objeto do ciclo de vida ProdOps)  
**Definição:** Qualquer feature, comportamento ou serviço que o time explorará, construirá e operará. É o objeto sobre o qual o OBC, o Commitment Gate e toda a jornada de execução operam. Uma Product Capability comprometida tem OBC em estado Refining ou além; uma Product Capability em exploração tem OBC em Draft.  
**Capítulo:** Cap 4 (primeira definição formal); Cap 3

---

### Decision Package
**Categoria:** Artefato  
**Definição:** Conjunto de artefatos que o Autor prepara para tornar o Commitment Gate possível. É um contrato de entrada no Gate, não documentação retroativa: precisa existir e ter substância antes da reunião. Componentes canônicos: hipótese respondida com evidência verificável (Evidence Threshold satisfeito quando declarado); Executive Summary; recomendação de outcome (um dos seis canônicos); riscos e incerteza residual declarada como aceitável; oportunidades reveladas; escopo Downstream. Critério transversal: verificabilidade por quem não participou do experimento, sem contexto verbal adicional.  
**Capítulo:** Cap 5 (estrutura interna); Cap 7 (papel no Commitment Gate)

---

### experiment.md
**Categoria:** Artefato  
**Definição:** Um dos dois artefatos obrigatórios de todo experimento Upstream. Documenta a estrutura permanente do experimento: Business Goal, Hypothesis (com Evidence Threshold quando declarado), Questions to Answer, Scope, Decision Package e Exit Criteria. A seção Decision Package determina se o experimento está maduro para o Commitment Gate.  
**Capítulo:** Cap 5

---

### upstream-trail.md (Upstream Trail)
**Categoria:** Artefato  
**Definição:** Um dos dois artefatos obrigatórios de todo experimento Upstream. Registro cronológico das sessões: o que foi feito, o que foi descoberto, quais artefatos foram produzidos, quais decisões foram tomadas e por quê. Serve a dois propósitos: durante o experimento, previne a perda de contexto entre sessões; no Commitment Gate, é a evidência de que o experimento teve progressão real. Também registra o outcome do Commitment Gate e a referência ao Work Item quando o OBC avança.  
**Capítulo:** Cap 5

---

### BDD Feature
**Categoria:** Artefato  
**Definição:** Especificação de comportamento observável escrita em formato BDD (Behavior Driven Development), com cenários Given/When/Then. No Commitment Gate (Momento 1), precisa existir como rascunho legível. É movida para `prodops/artifacts/bdd/` durante o Momento 2 (Artifact Promotion) e antes do Readiness Gate (Momento 3). O Phantom BDD (AP-D4) ocorre quando a BDD é escrita após o código, descrevendo o que foi implementado em vez de especificar o comportamento esperado.  
**Capítulo:** Cap 6 (papel no Downstream); Cap 7 (papel no Commitment Gate)

---

### Evidence Package
**Categoria:** Artefato  
**Definição:** Conjunto de evidências produzidas pelo experimento Upstream que fundamenta o Decision Package apresentado no Commitment Gate. Característica central: verificabilidade por um membro do trio que não participou do experimento, sem contexto verbal adicional. Se a evidência depende de contexto não documentado, não constitui evidência verificável. Responde à pergunta "o que descobrimos?". Distinto do Release Trail, que responde "como honramos o compromisso, passo a passo".  
**Capítulo:** Cap 8

---

### Release Trail
**Categoria:** Artefato  
**Definição:** Log append-only de evidências de cada fase da sequência Bootstrap → Promote no Downstream. Nada é substituído ou reescrito: apenas acrescido. Responde à pergunta "como honramos o compromisso, passo a passo, com que evidências?". O Promote sem Release Trail preenchido é o anti-padrão AP-D5 (Release Trail Vazio). O Assessment retrospectivo lê os Release Trails como uma das fontes primárias de avaliação da saúde do ciclo Downstream encerrado.  
**Capítulo:** Cap 8 (distinção vs. Evidence Package); Cap 6 (ciclo Downstream); Cap 4 (fonte do Assessment)

---

### Iteration Plan
**Categoria:** Artefato  
**Definição:** Output do Planning: conjunto de tasks ou spikes que a equipe de Delivery vai executar na sequência Bootstrap → Promote. Input do Planning é o OBC em estado Readiness. Decompõe o OBC em unidades de trabalho concretas, distribui responsabilidades, estima esforço por fase e registra dependências. Contém: tasks por fase, decomposição dos cenários BDD em comportamentos implementáveis, spikes de risco, dependências externas. É o equivalente Downstream do Experiment Plan.  
**Capítulo:** Cap 6

---

### Reliability Plan
**Categoria:** Artefato  
**Definição:** Define, antes da entrada no Delivery, as condições de confiabilidade que a Product Capability precisa satisfazer: SLIs iniciais, Reliability Rules, critérios de alerta e escalação. Em Product Capabilities de alto risco (movimentação financeira, integração externa, mudança de SLO), é exigido como condição do Readiness Gate. Em Product Capabilities de risco controlado, pode ser produzido durante o Downstream com menor formalidade.  
**Capítulo:** Cap 4 (Assessment prospectivo); Cap 6 (pré-requisito do Readiness Gate)

---

### Observable Events
**Categoria:** Artefato  
**Definição:** Eventos que tornam o comportamento de uma Product Capability verificável em runtime. São definidos no OBC com dimensões obrigatórias. O ODD (Observability Driven Design) exige que sejam definidos antes de qualquer linha de produção ser escrita. No Upstream, tornam a incerteza explícita para verificar a hipótese; no Downstream, são componente obrigatório do OBC Readiness.  
**Capítulo:** Cap 8 (ODD); Cap 6 (OBC Readiness)

---

### Initial SLIs
**Categoria:** Artefato/Métrica  
**Definição:** Métricas de confiabilidade iniciais com targets numéricos explícitos, definidas no OBC antes de qualquer fase de Hack. Verificadas no Readiness Gate como condição de entrada na Delivery.  
**Capítulo:** Cap 6 (OBC Readiness); Cap 8

---

### Reliability Rules
**Categoria:** Artefato  
**Definição:** Conjunto de regras de confiabilidade definidas no OBC que especificam o comportamento esperado do sistema em condições de falha, expiração e estados de erro.  
**Capítulo:** Cap 11 (OBC do Split Payment)

---

### framework-lock.yaml
**Categoria:** Artefato  
**Definição:** Arquivo de governança do ProdOps Framework que documenta a versão instalada do framework no repositório e a relação do repositório com o framework. O campo `status: self` indica que o repositório opera simultaneamente como produto consumidor e como fonte canônica do framework.  
**Capítulo:** Cap 11

---

### Relatório de ciclo
**Categoria:** Artefato  
**Definição:** Output do Assessment retrospectivo ao final de um ciclo. Síntese do que o ciclo revelou sobre a saúde do processo: anti-padrões detectados, sinais diagnósticos ativados, recomendações para o próximo ciclo. É a retrospectiva com base em evidência e o input estruturado para o planejamento do próximo ciclo.  
**Capítulo:** Cap 4

---

## Backlogs

### PIB (Product Intent Backlog)
**Categoria:** Backlog  
**Definição:** Backlog de nível de produto que contém os Local OBCs em estado Draft. Ponto de convergência dos dois caminhos de entrada: fluxo global (Portfolio Tracking List → BIB → OBC Partitioning → Local OBCs → PIB) e fluxo local (Product Tracking List → Premortem + Owner Approval → Business Intent + Local OBC Draft → PIB). Após a entrada no PIB, a distinção entre os dois caminhos se apaga. O Icebox é o estado pré-modo dos itens no PIB.  
**Capítulo:** Cap 3

---

### BIB (Business Intent Backlog)
**Categoria:** Backlog  
**Definição:** Backlog de nível de plataforma que contém Global OBCs em estado Draft, gerados a partir de Business Signals de escopo amplo (multi-produto). Os Global OBCs passam por Discovery no BIB antes de serem decompostos em Local OBCs via OBC Partitioning.  
**Capítulo:** Cap 3

---

### Portfolio Tracking List
**Categoria:** Backlog  
**Definição:** Lista de acompanhamento de nível de plataforma para Business Signals de escopo amplo (multi-produto). Converte Business Signals em Business Intent para o BIB. Distinta da Product Tracking List, que opera em nível de produto único.  
**Capítulo:** Cap 3

---

### Product Tracking List
**Categoria:** Backlog  
**Definição:** Lista de acompanhamento de nível de produto para Business Signals de destino definido (produto único). Business Signals entram aqui, passam por Premortem + Owner Approval e geram Business Intent com Local OBC Draft diretamente no PIB, sem passar pelo Portfolio.  
**Capítulo:** Cap 3

---

### Experiment Plan
**Categoria:** Backlog/Artefato  
**Definição:** VIEW sobre os itens do PIB que ativaram o caminho Upstream e possuem um experimento ativo. Não é um sprint: não tem data de término nem sequência obrigatória. Instrumento de visibilidade que responde à pergunta "quais hipóteses estamos investigando agora?" e torna visível o Discovery WIP. Equivalente Upstream do Iteration Plan.  
**Capítulo:** Cap 5

---

## Jornadas

### Jornada Discovery
**Categoria:** Jornada  
**Definição:** Jornada cuja responsabilidade central é reduzir incerteza e preparar o trabalho. Executada nos dois modos: no Upstream, com rigor não bloqueante e liberdade para perseguir hipóteses em direções não antecipadas; no Downstream (Discovery: Elaboration), com rigor bloqueante, satisfazendo condições verificáveis exigidas pelo Readiness Gate. Os artefatos obrigatórios do Discovery no Upstream são `experiment.md` e `upstream-trail.md`.  
**Capítulo:** Cap 3 (introdução); Cap 5 (Upstream); Cap 6 (Downstream: Elaboration)

---

### Jornada Delivery
**Categoria:** Jornada  
**Definição:** Jornada cuja responsabilidade central é construir, validar e promover a solução. No Upstream, sem sequência obrigatória. No Downstream, executa a sequência formal Bootstrap → Hack → Sync → Finish → Ship → Validate → Promote, com Gates de Definition of Done obrigatórios entre cada fase. A sequência é a materialização do rigor bloqueante na jornada Delivery.  
**Capítulo:** Cap 3 (introdução); Cap 6 (sequência Downstream)

---

### Jornada Operation
**Categoria:** Jornada  
**Definição:** Jornada cuja responsabilidade central é operar e evoluir o produto em produção. No Upstream, pode ser executada em ambientes controlados, sem SLOs formais. No Downstream, é produção real: SLOs definidos, runbooks existentes, protocolos formais de resposta a incidentes.  
**Capítulo:** Cap 3 (introdução); Cap 4 (Assessment e Operation)

---

### Jornada Assessment
**Categoria:** Jornada  
**Definição:** Jornada transversal de governança informacional do framework. Atua desde o Business Signal e retroalimenta o ciclo com novos Business Intents após a Operation. Não tem ponto de entrada fixo. Opera em duas dimensões: prospectiva (prepara o ambiente informacional para a decisão) e retrospectiva (extrai aprendizado de ciclos encerrados). Não decide sobre o destino de uma Product Capability; não define o que será construído; não é auditoria de conformidade.  
**Capítulo:** Cap 4 (definição canônica)

---

### Jornada Diligence
**Categoria:** Jornada  
**Definição:** Jornada transversal responsável por manter o sistema de trabalho sincronizado e consistente entre o Knowledge Space (artefatos Markdown no repositório) e o Execution Space (Issues, Pull Requests, GitHub Projects). Opera em dois ciclos: diligence-sync (event-driven) e diligence-async (proativo). No Upstream, rigor não bloqueante: alerta sem bloquear. No Downstream, rigor bloqueante: gera Findings que impedem o avanço. Não implementa software, não cria Pull Requests de implementação, não toma decisões de produto, não prioriza o backlog.  
**Capítulo:** Cap 9 (definição canônica)

---

### Discovery: Elaboration
**Categoria:** Sub-fase de jornada  
**Definição:** Período no modo Downstream entre o Commitment Gate (Momento 1) e o Readiness Gate (Momento 3). É a jornada Discovery executada em modo Downstream: não reduz incerteza de forma aberta, mas satisfaz condições verificáveis. Transforma o OBC em Refining e a BDD em rascunho nos artefatos que o Readiness Gate exige: completa a BDD Feature, define os Observable Events, resolve questões abertas do Decision Package, produz o Reliability Plan quando necessário, e faz o OBC transitar de Refining para Readiness.  
**Capítulo:** Cap 6

---

### Assessment Prospectivo
**Categoria:** Dimensão do Assessment  
**Definição:** Dimensão do Assessment que começa no Business Signal e prepara o ambiente informacional para as decisões do ciclo. Avalia a qualidade epistêmica do Decision Package: verificável por um membro do trio que não participou do experimento? Hipóteses respondidas com critérios de falsificação declarados? Riscos avaliados com base em evidência? Incerteza residual explicitamente declarada? Define se o caminho recomendado é Downstream direto ou jornada Upstream.  
**Capítulo:** Cap 4

---

### Assessment Retrospectivo
**Categoria:** Dimensão do Assessment  
**Definição:** Dimensão do Assessment ativada ao final de qualquer ciclo com registro formal. Lê o que o ciclo produziu de evidência sobre o funcionamento do sistema de trabalho. Fontes em ciclos Upstream: upstream-trail, Decision Package, outcome do Commitment Gate. Fontes em ciclos Downstream: DORA Extended, Gate Failure Rate, Decision Latency, Postmortems, OBCs Released. Produz: relatório de ciclo e novos Business Signals.  
**Capítulo:** Cap 4

---

## Estados do OBC

### Draft
**Categoria:** Estado do OBC  
**Definição:** Estado inicial do OBC. Nasce na transição de um Business Signal para um Business Intent. No Upstream, é memória do aprendizado: pode ser atualizado continuamente, pode permanecer incompleto, não bloqueia experimentos. O OBC Draft precisa existir como arquivo antes do Commitment Gate (apenas existência é obrigatória, não completude). Transita para Refining com o outcome Promover; transita para Archived com o outcome Descartar.  
**Capítulo:** Cap 3

---

### Refining
**Categoria:** Estado do OBC  
**Definição:** Estado do OBC em dois contextos distintos. Contexto primário: início do Downstream (Momento 2, após Commitment Gate com outcome Promover), quando os campos começam a ser refinados com substância real, a BDD Feature é elaborada e o item entra em Discovery: Elaboration. Contexto de regressão: quando um item que estava em Delivery: Readiness ou Delivery: Iteration Plan retorna ao Refining por mudança de escopo ou descoberta que invalida o contrato; nesse caso precisa satisfazer novamente o Readiness Gate antes de avançar.  
**Capítulo:** Cap 3

---

### Readiness
**Categoria:** Estado do OBC  
**Definição:** Estado do OBC que certifica que a Discovery Downstream produziu um contrato completo e verificável por terceiros. O modo Downstream e o rigor bloqueante estão ativos desde o Promover (Momento 2); o estado Readiness não representa a mudança de regime, mas a conclusão da Discovery: Elaboration. Todo critério de aceite é verificável sem contexto verbal adicional. As métricas de sucesso têm baseline e target. Os Observable Events estão definidos com dimensões mensuráveis. Um OBC que não atingiu Readiness não passa pelo Readiness Gate.  
**Capítulo:** Cap 3; Cap 6

---

### In Delivery
**Categoria:** Estado do OBC  
**Definição:** Estado do OBC quando está associado a um item em execução no Iteration Plan. Mudanças de parâmetro são permitidas dentro da faixa de incerteza residual declarada; mudanças estruturais exigem regressão ao Upstream.  
**Capítulo:** Cap 3

---

### Released
**Categoria:** Estado do OBC  
**Definição:** Estado do OBC quando o comportamento comprometido pode ser verificado em runtime. A Product Capability está em produção com os Observable Events funcionando e as métricas de sucesso acompanhadas. Released registra que o comportamento comprometido está verificável em runtime, não que o outcome de negócio foi necessariamente alcançado. O OBC continua sendo atualizado conforme novas evidências operacionais.  
**Capítulo:** Cap 3

---

### Archived
**Categoria:** Estado do OBC  
**Definição:** Estado do OBC quando a Product Capability foi descontinuada ou substituída, ou quando o Commitment Gate resultou em Descartar (Draft → Archived). O OBC permanece como registro histórico e não é deletado. O aprendizado é registrado em `prodops/framework/journeys/discovery/learnings.md` no caso de descarte.  
**Capítulo:** Cap 3; Cap 7

---

### Icebox
**Categoria:** Estado (pré-modo)  
**Definição:** Estado pré-modo do PIB. Representa itens com OBC Draft que ainda não tiveram modo declarado, aguardando a decisão de ir diretamente ao Commitment Gate (contexto de negócio suficiente) ou de abrir um experimento Upstream. Não é um estado formal do OBC: é uma designação operacional do backlog. Itens que saem do Icebox via Commitment Gate entram em Discovery: Elaboration com OBC Refining; itens que ativam o Upstream passam pelas VIEWs In Hypothesis e Experiment Plan.  
**Capítulo:** Cap 3; Cap 5

---

### Upstream: In Hypothesis
**Categoria:** Estado  
**Definição:** VIEW do OBC Draft em que a hipótese está em formação no modo Upstream, antes da abertura formal do experimento (`experiment.md` ainda não aberto). É a primeira etapa do caminho Upstream após a saída do Icebox.  
**Capítulo:** Cap 5

---

### Upstream: Evidence Running
**Categoria:** Estado  
**Definição:** VIEW do OBC Draft em modo Upstream em que código está rodando sem compromisso: em Sandbox Deploy ou em Produção Controlada. Etapa possível dentro do Experiment Plan quando o experimento requer implantação para coletar evidência.  
**Capítulo:** Cap 5

---

### Downstream Declared
**Categoria:** Estado  
**Definição:** Estado da Product Capability imediatamente após o Commitment Gate com outcome Promover (Momento 1). O compromisso foi assumido. O item entra em Discovery: Elaboration. O rigor bloqueante está ativo. A Delivery ainda não começou. Corresponde ao ponto em que o OBC transita de Draft para Refining.  
**Capítulo:** Cap 6

---

### Downstream Ready
**Categoria:** Estado  
**Definição:** Estado da Product Capability após a satisfação e verificação dos requisitos de pré-Delivery pelo Readiness Gate (Momento 3). Corresponde ao OBC em estado Readiness, com BDD Feature em `prodops/artifacts/bdd/`, riscos documentados e Reliability Plan ativo (quando exigido). A Delivery ainda não começou: entre o Downstream Ready e a Delivery existe o Planning (que gera o Iteration Plan) e só então o Bootstrap.Started.  
**Capítulo:** Cap 6

---

### Delivery Started (Bootstrap.Started)
**Categoria:** Estado  
**Definição:** Estado da Product Capability a partir do momento em que o Bootstrap é iniciado. É o terceiro estado do protocolo de transição Downstream: após Downstream Declared (Momento 1) e Downstream Ready (Momento 3). A partir daqui, a sequência formal de Delivery está em execução.  
**Capítulo:** Cap 6

---

## Mecanismos

### Commitment Gate
**Categoria:** Mecanismo  
**Definição:** Gate que medeia a transição Upstream → Downstream. Convocado pelo trio (PM + Tech Lead + Autor) quando o substrato é suficiente para tomar a decisão de compromisso. Qualquer membro do trio pode convocar. Não cria o compromisso: torna verificável e rastreável a decisão que o trio toma sobre o destino da Product Capability. É um mecanismo universal: pode ocorrer ao final de experimentos Upstream, em qualquer momento dentro do Upstream, ou na entrada do PIB diretamente a partir de um Business Signal quando o contexto dispensa exploração prévia. O Decision Package é o contrato de entrada. Define seis outcomes canônicos.  
**Capítulo:** Cap 3 (introdução); Cap 7 (definição canônica completa)

---

### Readiness Gate (Momento 3)
**Categoria:** Mecanismo  
**Definição:** Gate que verifica, de forma bloqueante, se o item saindo da Discovery: Elaboration tem o substrato necessário para ser executado com integridade no Delivery. Não é opcional. Condições verificadas: OBC em estado Readiness, BDD Feature em `prodops/artifacts/bdd/`, riscos documentados, Findings de Diligence abertos com waiver formal ou resolvidos, Reliability Plan ativo (quando exigido para itens de alto risco). A Diligence opera de forma bloqueante neste Gate.  
**Capítulo:** Cap 6

---

### Momento 1 (Commitment Gate)
**Categoria:** Mecanismo  
**Definição:** Primeiro dos três momentos do protocolo de transição Upstream → Downstream. O trio avalia se a evidência produzida justifica o comprometimento. Critérios: hipótese respondida com Evidence Threshold satisfeito (quando declarado), Decision Package com substância real, OBC Draft existindo como arquivo, BDD rascunhada e legível. O resultado Promover dispara o Momento 2.  
**Capítulo:** Cap 6

---

### Momento 2 (Artifact Promotion)
**Categoria:** Mecanismo  
**Definição:** Segundo dos três momentos do protocolo de transição. Imediatamente após o Commitment Gate com outcome Promover. O OBC muda de Draft para Refining. Um Work Item entra em Discovery: Elaboration referenciando o experimento e o OBC. O upstream-trail é atualizado com o outcome e a referência ao Work Item. O Downstream está ativo, mas a Delivery não começou.  
**Capítulo:** Cap 6

---

### Momento 3 (Readiness Gate)
**Categoria:** Mecanismo  
**Definição:** Terceiro dos três momentos do protocolo de transição. O item sai da Discovery: Elaboration e entra em Delivery: Readiness quando o conjunto de requisitos é satisfeito: OBC em estado Readiness, BDD Feature em `prodops/artifacts/bdd/`, riscos documentados, Reliability Plan ativo (quando exigido). A Diligence verifica de forma bloqueante.  
**Capítulo:** Cap 6

---

### OBC Partitioning
**Categoria:** Mecanismo  
**Definição:** Processo pelo qual um Global OBC (escopo multi-produto, gerado no BIB) é decomposto em Local OBCs, um por produto envolvido, cada um entrando no PIB do produto correspondente. Ocorre após a Discovery no BIB. Após o particionamento, a origem deixa de importar: todos os Local OBCs seguem o mesmo ciclo de estados.  
**Capítulo:** Cap 3

---

### diligence-sync
**Categoria:** Mecanismo  
**Definição:** Ciclo event-driven da Diligence, acionado por um evento específico (novo OBC criado, item transitando entre estados, Commitment Gate convocado). Verifica, no momento do evento, se o estado atual satisfaz os critérios necessários para avançar. No Downstream, gera Findings bloqueantes; no Upstream, alerta sem bloquear.  
**Capítulo:** Cap 9

---

### diligence-async
**Categoria:** Mecanismo  
**Definição:** Ciclo proativo e periódico da Diligence que varre o estado do sistema para identificar divergências antes que causem problemas. Detecta drift: OBC que deveria ter transitado de estado; BDD Feature sem OBC Readiness; experimento ativo sem Evidence Threshold declarado (sinal S1). Rigor não bloqueante no Upstream; bloqueante no Downstream.  
**Capítulo:** Cap 9

---

### ODD (Observability Driven Design)
**Categoria:** Mecanismo/Princípio  
**Definição:** Princípio do ProdOps que afirma que observabilidade precisa ser projetada antes da implementação. Princípio 3: "Observabilidade, estratégia de deploy e testes são definidos antes de escrever código de produção, nessa ordem de prioridade." Princípio 7: "Uma feature não está pronta se seu comportamento não puder ser observado em produção." No Upstream, documenta o que será observado para verificar a hipótese; no Downstream, define Observable Events e métricas de sucesso do OBC antes de escrever código.  
**Capítulo:** Cap 8

---

### Planning
**Categoria:** Mecanismo  
**Definição:** Etapa que transforma o OBC Readiness em um Iteration Plan executável. Não cria compromisso novo: torna o compromisso executável. Conduzido pelo trio com participação do time de implementação. Critério de encerramento: o Iteration Plan cobre todos os acceptance criteria do OBC de forma rastreável e todos os impedimentos conhecidos têm resolução prevista.  
**Capítulo:** Cap 6

---

### Protocolo de Regressão Downstream → Upstream
**Categoria:** Mecanismo  
**Definição:** Protocolo que suspende formalmente o compromisso Downstream quando um item em Delivery revela que a hipótese original foi invalidada, o escopo mudou materialmente ou uma dependência bloqueante tornou a entrega inviável. Convocado pelo trio. Dois registros obrigatórios: no Release Trail (contexto, o que foi descoberto, decisão de suspender) e em um novo experimento Upstream referenciando o original. O OBC transita de In Delivery para Refining: compromisso suspenso, não abandonado.  
**Capítulo:** Cap 6

---

### Evidence Threshold
**Categoria:** Mecanismo  
**Definição:** Critério explícito que define quando a evidência produzida é suficiente para tomar uma decisão de comprometimento. No Upstream, é opcional (recomendado, mas não obrigatório). Se declarado, revisões ao threshold devem ser registradas no upstream-trail. Se não declarado, o critério de parada é o julgamento do autor. O que não é aceitável é a ausência total de critério de parada.  
**Capítulo:** Cap 5

---

### Waiver
**Categoria:** Mecanismo  
**Definição:** Reconhecimento explícito de que um critério não está satisfeito, acompanhado da justificativa de por que o item avança assim mesmo e de um compromisso de resolver o problema dentro de um prazo definido. Não é aprovação de lacuna sem consequência. A diferença entre um waiver e o Forced Readiness (AP-D3): o waiver é explícito e registrado; o Forced Readiness é silencioso. Aprovado pelo trio com data de expiração, fecha o Finding correspondente.  
**Capítulo:** Cap 9

---

### Sandbox Deploy
**Categoria:** Mecanismo  
**Definição:** Ato de implantação possível no modo Upstream. Código implantado em stack efêmera e isolada, sem tráfego de cliente real. A stack é destruída ao final do experimento. Sem Release Trail, sem OBC Readiness. Não constitui Promoção de Product Capability.  
**Capítulo:** Cap 5

---

### Produção Controlada
**Categoria:** Mecanismo  
**Definição:** Ato de implantação possível no modo Upstream: código Upstream implantado em produção real, sem Commitment Gate. Requer autorização explícita do time e da liderança. Rollback imediato disponível. O que foi observado deve ser registrado no upstream-trail. O código chega a produção; a Product Capability permanece em exploração. Distinta da Promoção de Product Capability, que exige Commitment Gate com outcome Promover.  
**Capítulo:** Cap 5

---

### Promoção de Product Capability
**Categoria:** Mecanismo  
**Definição:** Saída formal do modo Upstream para o modo Downstream, mediante Commitment Gate com outcome Promover. O OBC transita de Draft para Refining; a BDD Feature existe como rascunho nos paths do Downstream. O item entra em Discovery: Elaboration. Não é automática: ocorre apenas com o Gate executado.  
**Capítulo:** Cap 5

---

### ProdOps TDD
**Categoria:** Mecanismo  
**Definição:** Variante de Test-Driven Development usada durante a fase Hack da sequência Downstream. Comportamento observável é definido via BDD Feature e Observable Events antes de qualquer linha de produção ser escrita. Implementa o princípio ODD dentro do ciclo de implementação.  
**Capítulo:** Cap 6

---

### Premortem + Owner Approval
**Categoria:** Mecanismo  
**Definição:** Etapa do fluxo local antes da geração da Business Intent no PIB. O Business Signal que tem destino definido (produto único) passa por Premortem (avaliação antecipada de riscos e falhas potenciais) e Owner Approval (aprovação de quem tem autoridade sobre o produto) antes de se transformar em Business Intent com Local OBC Draft.  
**Capítulo:** Cap 3

---

### Validation Workbench
**Categoria:** Ambiente  
**Definição:** Ambiente de simulação local para cenários que o sandbox de um provedor externo não consegue reproduzir deterministicamente. Confirmado no corpus da Magazine Siará (EXP-002) como estratégia de validação local para o ciclo de cartão de crédito.  
**Capítulo:** Apêndice Experimentos

---

## Outcomes do Commitment Gate

### Outcome: Promover
**Categoria:** Outcome do Gate  
**Definição:** A evidência justifica o comprometimento. O OBC transita de Draft para Refining (Momento 2), a BDD Feature é movida para os paths comprometidos e o item entra em Discovery: Elaboration com o Downstream declarado. O rigor bloqueante está ativo a partir deste ponto.  
**Capítulo:** Cap 7

---

### Outcome: Promover com restrição
**Categoria:** Outcome do Gate  
**Definição:** Redução formal do escopo comprometido em relação ao Business Intent original. Parte da Product Capability avança para o compromisso; outra parte continua em exploração. O compromisso formal é assumido exclusivamente sobre o subconjunto aprovado. A restrição é registrada explicitamente no upstream-trail.  
**Capítulo:** Cap 7

---

### Outcome: Requer outro experimento
**Categoria:** Outcome do Gate  
**Definição:** A evidência produzida não é suficiente para o comprometimento, mas a hipótese ainda é válida. Um novo experimento é criado com hipótese mais específica ou rota de coleta diferente. Não é fracasso: é o reconhecimento de que a exploração precisa de mais uma iteração.  
**Capítulo:** Cap 7

---

### Outcome: Aguardar decisão de negócio
**Categoria:** Outcome do Gate  
**Definição:** O trio não pode comprometer porque existe uma decisão de negócio pendente (orçamento, estratégia, stakeholder) fora do escopo da equipe resolver. O item fica bloqueado com o decisor identificado e uma data esperada de resolução. Nenhum novo experimento é aberto até a decisão chegar.  
**Capítulo:** Cap 7

---

### Outcome: Aguardar dependência externa
**Categoria:** Outcome do Gate  
**Definição:** O comprometimento é inviável por dependência técnica ou de terceiro fora do controle da equipe. A dependência é registrada no Reliability Plan e na Product Tracking List. Quando resolvida, o trio é reconvocado.  
**Capítulo:** Cap 7

---

### Outcome: Descartar
**Categoria:** Outcome do Gate  
**Definição:** A hipótese foi refutada ou o contexto mudou de forma que o investimento não se justifica. O OBC transita de Draft para Archived. O aprendizado é registrado em `prodops/framework/journeys/discovery/learnings.md`. O experimento é encerrado com justificativa no upstream-trail. Estado de origem: Draft.  
**Capítulo:** Cap 7

---

## Fases de Delivery (sequência Downstream)

### Bootstrap
**Categoria:** Fase de Delivery  
**Definição:** Primeira fase. Verifica que o ambiente local está operacional e que as pré-condições de implementação estão satisfeitas. Emite Bootstrap.Started e Bootstrap.Completed. Se o Bootstrap falha no smoke Gate, o Hack não começa. Integra o CI Sync (trabalho local e síncrono).  
**Capítulo:** Cap 6

---

### Hack
**Categoria:** Fase de Delivery  
**Definição:** Segunda fase. Implementa via ProdOps TDD: comportamento observável definido antes de qualquer linha de produção ser escrita. A BDD Feature deve existir antes do primeiro commit de implementação. Integra o CI Sync.  
**Capítulo:** Cap 6

---

### Sync
**Categoria:** Fase de Delivery  
**Definição:** Terceira fase. Garante que a branch está atualizada e que os artefatos ProdOps refletem o que foi implementado. Integra o CI Sync.  
**Capítulo:** Cap 6

---

### Finish
**Categoria:** Fase de Delivery  
**Definição:** Quarta fase. Executa os quality Gates de código e produz o Pull Request com narrativa completa. Se o Finish detecta testes falhos, o Ship não começa. Integra o CI Sync.  
**Capítulo:** Cap 6

---

### Ship
**Categoria:** Fase de Delivery  
**Definição:** Quinta fase. Constrói e publica o artefato, conduzida pela plataforma. Integra o CI Async (trabalho conduzido pela plataforma: Ship, Validate, Promote).  
**Capítulo:** Cap 6

---

### Validate
**Categoria:** Fase de Delivery  
**Definição:** Sexta fase. Implanta e valida em runtime. Se o Validate identifica violação de SLO, o Promote não acontece. Integra o CI Async.  
**Capítulo:** Cap 6

---

### Promote
**Categoria:** Fase de Delivery  
**Definição:** Sétima e última fase. Promove o código para produção com rastreabilidade total. O Promote sem Release Trail preenchido é o anti-padrão AP-D5. Após o Promote, o OBC transita para Released. Integra o CI Async.  
**Capítulo:** Cap 6

---

### CI Sync
**Categoria:** Conceito  
**Definição:** Primeiro ciclo da sequência de Delivery, composto pelas fases Bootstrap, Hack, Sync e Finish. É o trabalho local e síncrono da equipe de implementação. Cada fase tem Definition of Done que, se não satisfeita, bloqueia o avanço.  
**Capítulo:** Cap 6

---

### CI Async
**Categoria:** Conceito  
**Definição:** Segundo ciclo da sequência de Delivery, composto pelas fases Ship, Validate e Promote. É o trabalho conduzido pela plataforma: construir e publicar o artefato, implantá-lo, validá-lo em runtime e promovê-lo com evidência registrada.  
**Capítulo:** Cap 6

---

## Papéis

### Autor
**Categoria:** Papel  
**Definição:** Papel de quem identifica e registra o Business Signal, conduz ou acompanha os experimentos Upstream, prepara o Decision Package e o apresenta no Commitment Gate. Tem responsabilidade epistêmica sobre a investigação. No Commitment Gate, atua como quem conduziu o experimento. Pode ser o PM, o Tech Lead, um engenheiro ou um analista.  
**Capítulo:** Cap 3

---

### Product Manager (PM)
**Categoria:** Papel  
**Definição:** Responsável pelo contexto de negócio e pelo alinhamento estratégico da Product Capability. No Commitment Gate, atua como leitor independente do Decision Package: avalia se as hipóteses respondidas justificam o compromisso, se o escopo é coerente com a estratégia e se os riscos estão em nível aceitável. O framework usa PM como termo canônico e não distingue Product Manager de Product Owner (Scrum).  
**Capítulo:** Cap 3

---

### Tech Lead
**Categoria:** Papel  
**Definição:** Responsável pela viabilidade técnica e pela integridade da arquitetura. No Commitment Gate, atua como leitor independente: avalia se o Decision Package reflete os riscos técnicos reais, se o Reliability Plan é adequado e se a estimativa de esforço Downstream é fundamentada.  
**Capítulo:** Cap 3

---

### Trio
**Categoria:** Papel  
**Definição:** Unidade mínima de decisão do Commitment Gate: Autor, PM e Tech Lead. A presença dos três não é protocolo de governança: é condição epistêmica. O Autor tem profundidade sobre a investigação (possível viés de confirmação). O PM tem contexto de negócio (pode subestimar complexidade técnica). O Tech Lead tem visão técnica (pode não ter visibilidade da urgência estratégica). O trio existe para que nenhuma perspectiva seja o único filtro da decisão.  
**Capítulo:** Cap 3

---

## Origin Streams

### Origin Stream
**Categoria:** Classificação  
**Definição:** Classificação de onde a necessidade de uma Product Capability nasceu. Todo Business Signal carrega exatamente um Origin Stream. Não determina como o trabalho será executado, mas informa o contexto e os critérios de sucesso. Quando um Signal parece pertencer a dois Origin Streams, o critério de desempate é o beneficiário primário da mudança.  
**Capítulo:** Cap 4

---

### Origin Stream: Business
**Categoria:** Origin Stream  
**Definição:** Necessidades geradas pelo mercado ou pelo cliente. Propósito: aumentar valor entregue ao mercado (novos canais, conversão, retenção, redução de churn). O OBC resultante define comportamento observável de produto, verificável via BDD Feature.  
**Capítulo:** Cap 4

---

### Origin Stream: Enterprise
**Categoria:** Origin Stream  
**Definição:** Necessidades impostas por exigência legal, regulatória, contratual ou de governança corporativa. Propósito: garantir conformidade, atender auditoria, integrar sistemas internos. O OBC define comportamento auditável e rastreável.  
**Capítulo:** Cap 4

---

### Origin Stream: Team
**Categoria:** Origin Stream  
**Definição:** Necessidades geradas pelo próprio time para evoluir a forma de trabalhar (ferramentas, automações, onboarding, fluxo de engenharia). Propósito: melhorar produtividade, qualidade e experiência do engenheiro. O OBC define comportamento verificável no processo do time.  
**Capítulo:** Cap 4

---

### Origin Stream: Technology
**Categoria:** Origin Stream  
**Definição:** Necessidades técnicas de plataforma (segurança, infraestrutura, confiabilidade, débito técnico). Propósito: evoluir arquitetura, observabilidade, escalabilidade e resiliência do sistema. O OBC define critérios técnicos mensuráveis: SLOs, métricas de segurança, benchmarks de performance.  
**Capítulo:** Cap 4

---

## Anti-padrões

### Perpetual Discovery
**Categoria:** Anti-padrão  
**Definição:** Estado de um experimento cujos indicadores de parada estão ausentes, ambíguos ou demonstravelmente inalcançáveis. O experimento não continua por necessidade real de mais evidência: continua porque o critério que encerraria a exploração não existe ou não pode ser satisfeito. Três condições estruturais produzem esse estado: ausência de Evidence Threshold declarado; hipótese central nunca formalizada como falsificável; Commitment Gate visto como evento de aprovação. O framework identifica quatro sinais diagnósticos (S1-S4), cada um individualmente suficiente para convocar o Commitment Gate imediatamente.  
**Capítulo:** Cap 5 (definição canônica); Cap 7

---

### S1: Ausência de critério de parada declarado
**Categoria:** Sinal de Perpetual Discovery  
**Definição:** O experimento não definiu Evidence Threshold no `experiment.md` e não registrou critério de parada substituto explícito. Quando nenhum critério está declarado, o threshold implícito é "quando tivermos evidência suficiente", que nunca se satisfaz sozinho.  
**Capítulo:** Cap 5

---

### S2: Hipótese central não falsificável
**Categoria:** Sinal de Perpetual Discovery  
**Definição:** A hipótese foi formulada de forma que nenhum resultado possível a refuta, ou nunca foi formalizada como pergunta com resposta verificável. Sem o que falsificar, não existe resultado que encerre o experimento.  
**Capítulo:** Cap 5

---

### S3: Questions to Answer demonstravelmente inalcançáveis
**Categoria:** Sinal de Perpetual Discovery  
**Definição:** Uma ou mais perguntas foram marcadas como "não respondíveis com a evidência disponível" e o experimento não identificou nova rota de evidência nem reformulou a hipótese central. O experimento está bloqueado: não consegue satisfazer seus próprios indicadores de parada.  
**Capítulo:** Cap 5

---

### S4: Evidence Threshold declarado mas inalcançável pela rota atual
**Categoria:** Sinal de Perpetual Discovery  
**Definição:** O critério de parada existe, mas a evidência acumulada não o satisfaz e novas fontes não foram identificadas. Continuar coletando evidência do mesmo tipo não alterará o resultado: a rota atual é um beco sem saída estrutural.  
**Capítulo:** Cap 5

---

### AP-D1: Gate Theater
**Categoria:** Anti-padrão  
**Definição:** Executar os Gates formalmente sem que os artefatos submetidos satisfaçam os critérios. Causa: pressão de prazo ou conveniência social. Exemplos: OBC marcado como Readiness sem acceptance criteria verificáveis; Readiness Gate aprovado com Findings abertos sem waiver; Commitment Gate realizado sem que o Decision Package tenha sido lido. Critério diagnóstico: ausência de registro de verificação item a item para cada Gate.  
**Capítulo:** Cap 6

---

### AP-D2: Proxy Commitment
**Categoria:** Anti-padrão  
**Definição:** OBC marcado como Readiness sem que os critérios de sucesso sejam mensuráveis. Exemplos: `expected_outcome` vago; `acceptance_criteria` descrevendo o que o sistema faz, não quando é aceitável; `success_metrics` com targets relativos sem baseline. Critério diagnóstico: "como saberei que este item foi entregue com sucesso 30 dias após o Promote?" — se a resposta requer interpretação subjetiva, o OBC não está Readiness de verdade.  
**Capítulo:** Cap 6

---

### AP-D3: Forced Readiness
**Categoria:** Anti-padrão  
**Definição:** Readiness Gate aprovado com lacunas conhecidas (artefatos incompletos, Findings abertos, pré-requisitos ausentes) por pressão de prazo ou de stakeholder. Distinto do Gate Theater em escopo: Gate Theater cobre qualquer Gate; Forced Readiness é especificamente o Readiness Gate aprovado com lacunas de artefatos de pré-Delivery. Distinto do waiver: o waiver é explícito e registrado; o Forced Readiness é silencioso.  
**Capítulo:** Cap 6

---

### AP-D4: Phantom BDD
**Categoria:** Anti-padrão  
**Definição:** BDD Feature escrita após o código, descrevendo o que foi implementado em vez do comportamento esperado antes da implementação. A BDD existe como artefato formal, mas perdeu sua função. Critério diagnóstico: verificar o timestamp de criação do feature file versus o início da fase Hack; se o feature file foi criado depois do primeiro commit, a BDD é phantom.  
**Capítulo:** Cap 6

---

### AP-D5: Release Trail Vazio
**Categoria:** Anti-padrão  
**Definição:** Promote executado sem Release Trail preenchido. Causa: Release Trail tratado como formalidade opcional. Consequência: a rastreabilidade que o Downstream promete, desde o Commitment Gate até a evidência em produção, é destruída. O EXP-014 demonstrou (53/53 PASS) que o ProdOps Runtime rastreia automaticamente o estado de Delivery via CloudEvents, tornando o Release Trail Vazio detectável pela Diligence no momento em que acontece.  
**Capítulo:** Cap 6

---

### Promoção Prematura
**Categoria:** Anti-padrão  
**Definição:** Comprometer uma Product Capability antes de ter evidência suficiente, seja por pressão de prazo, seja por otimismo não verificado. O Decision Package como contrato de entrada do Commitment Gate, com a regra de verificabilidade independente, é o mecanismo de proteção.  
**Capítulo:** Cap 7

---

## Métricas

### TTE (Time to Evidence)
**Categoria:** Métrica  
**Definição:** Tempo entre o início de um experimento Upstream (abertura do `experiment.md`) e a produção da primeira evidência executável. Mede a velocidade com que um experimento começa a produzir aprendizado real. Em processo de canonização, sem implementação de coleta automática ainda disponível.  
**Capítulo:** Cap 8

---

### Decision Latency
**Categoria:** Métrica  
**Definição:** Tempo entre o Evidence Threshold declarado como atingido e a convocação do Commitment Gate. Uma Decision Latency alta é sinal de Perpetual Discovery: o time sabe que tem evidência suficiente, mas não está convocando a decisão. Em processo de canonização.  
**Capítulo:** Cap 8

---

### Discovery WIP (Work in Progress)
**Categoria:** Métrica  
**Definição:** Número de experimentos Upstream ativos simultaneamente. O nome é por analogia com o WIP do Kanban e refere-se ao modo Upstream como um todo, não exclusivamente à jornada Discovery. Um Discovery WIP alto indica dispersão de atenção entre múltiplas hipóteses, o que tende a aumentar o TTE de todas elas. Em processo de canonização.  
**Capítulo:** Cap 8; Cap 5

---

### Gate Failure Rate
**Categoria:** Métrica  
**Definição:** Frequência com que os Gates foram bloqueados antes de serem satisfeitos. Lido pelo Assessment retrospectivo em ciclos Downstream. É sinal de rigor inadequado ou de processo deficiente na preparação dos artefatos de pré-Gate.  
**Capítulo:** Cap 4

---

### DORA Extended
**Categoria:** Métrica (modelo)  
**Definição:** Modelo de métricas do ProdOps para a jornada Delivery no Downstream. Parte das quatro métricas históricas do DORA Research Program (Lead Time for Change, Release Frequency, Change Fail Rate, MTTR) e as complementa com extensões orientadas a produto e operação (Reaction Time, Rate of Return, Availability). Os pesos variam por estágio de produto (PoC, MVP, MVT, MLP).  
**Capítulo:** Cap 8

---

### Lead Time for Change
**Categoria:** Métrica (DORA Extended)  
**Definição:** Tempo do commit até produção. Parte das quatro métricas com raiz no DORA histórico. Peso máximo em estágios iniciais (PoC, MVP).  
**Capítulo:** Cap 8

---

### Release Frequency
**Categoria:** Métrica (DORA Extended)  
**Definição:** Frequência de deploys bem-sucedidos para produção. Adaptação do Deployment Frequency original do DORA.  
**Capítulo:** Cap 8

---

### Change Fail Rate
**Categoria:** Métrica (DORA Extended)  
**Definição:** Percentual de mudanças que causam falha em produção. Peso crescente em estágios avançados (MVT, MLP).  
**Capítulo:** Cap 8

---

### Mean Time to Recovery (MTTR)
**Categoria:** Métrica (DORA Extended)  
**Definição:** Tempo médio de recuperação após falha. Equivalente ao Failed Deployment Recovery Time na formulação DORA 2024-2026. Peso crescente em estágios avançados.  
**Capítulo:** Cap 8

---

### Reaction Time
**Categoria:** Métrica (DORA Extended — extensão ProdOps)  
**Definição:** Tempo entre um sinal externo (incidente, reclamação de usuário ou mudança regulatória) e a primeira ação processada sobre ele. Um time que entrega com Lead Time baixo mas tem Reaction Time alto está operando bem internamente e mal em resposta ao ambiente.  
**Capítulo:** Cap 8

---

### Rate of Return
**Categoria:** Métrica (DORA Extended — extensão ProdOps)  
**Definição:** Defeitos escapados e rework, medidos por retentativas, estornos e correções pós-Promote.  
**Capítulo:** Cap 8

---

### Availability
**Categoria:** Métrica (DORA Extended — extensão ProdOps)  
**Definição:** Uptime operacional do serviço. Peso crescente em estágios avançados.  
**Capítulo:** Cap 8

---

## Espaços do sistema de trabalho

### Knowledge Space
**Categoria:** Espaço  
**Definição:** Espaço onde o conhecimento vive: arquivos Markdown, OBCs, BDD Features, experimentos, trails, planos, evidências, todos no repositório git. Artefatos com identidade permanente e estado canônico. Quando há divergência entre o que está registrado num artefato Markdown e o que aparece nas ferramentas de execução, a divergência se resolve em favor do artefato: o Knowledge Space é a fonte persistente de conhecimento e de estado canônico dos artefatos.  
**Capítulo:** Cap 9

---

### Execution Space
**Categoria:** Espaço  
**Definição:** Espaço onde o trabalho acontece: GitHub Issues, Pull Requests, GitHub Projects, pipelines. Artefatos de natureza operacional: rastreiam o trabalho em andamento, não acumulam permanência do conhecimento. Um GitHub Issue pode ser fechado, reaberto, deletado; um campo de GitHub Project pode ser editado sem rastreabilidade. A Diligence existe para gerenciar a divergência entre Knowledge Space e Execution Space.  
**Capítulo:** Cap 9

---

## Finding

### Finding
**Categoria:** Artefato  
**Definição:** Unidade de trabalho da Diligence. Divergência identificada entre o que o sistema de trabalho deveria estar mostrando e o que está mostrando. Progride por quatro fases: Capture (identificado e documentado: o que foi detectado, onde, quando, impacto esperado); Attach (associado ao item afetado, com Work Item no Execution Space); Promote (sendo endereçado pela equipe; processo de waiver pode ser iniciado); Close (resolvido com evidência ou waiver aprovado pelo trio com data de expiração). No Downstream, Finding aberto sem waiver impede o avanço do item afetado.  
**Capítulo:** Cap 9

---

## Fluxos

### Fluxo Global
**Categoria:** Mecanismo  
**Definição:** Caminho de entrada no PIB para Business Signals de escopo amplo (multi-produto ou plataforma). O Signal entra no Portfolio Tracking List, gera uma Business Intent no BIB, onde um Global OBC Draft nasce. Após Discovery no BIB e OBC Partitioning, o Global OBC é decomposto em Local OBCs e cada produto recebe seu item no PIB.  
**Capítulo:** Cap 3

---

### Fluxo Local
**Categoria:** Mecanismo  
**Definição:** Caminho de entrada no PIB para Business Signals de destino definido (produto único, time único). O Signal entra na Product Tracking List, passa por Premortem e Owner Approval, e gera uma Business Intent com Local OBC Draft diretamente no PIB, sem passar pelo Portfolio.  
**Capítulo:** Cap 3

---

## Outros conceitos

### Incerteza residual aceitável
**Categoria:** Conceito  
**Definição:** O Upstream não precisa eliminar toda a incerteza para que o Commitment Gate possa ocorrer. O que é "aceitável" é julgamento coletivo do trio. A incerteza residual deve ser explicitamente declarada como aceitável no Decision Package: riscos não declarados no Commitment Gate são riscos gerenciados sem visibilidade.  
**Capítulo:** Cap 5

---

### Concepção
**Categoria:** Período  
**Definição:** Período entre o registro do Business Signal e sua entrada no BIB (fluxo global) ou no PIB (fluxo local). Nenhuma jornada de execução foi ativada ainda. Nenhum compromisso foi assumido. O Assessment prospectivo já tem trabalho a fazer nesse período: avaliar se o ambiente informacional tem contexto suficiente para a decisão de avançar.  
**Capítulo:** Cap 4

---

### Cadeia operacional COMPROMISSO → MODO → RIGOR → EVIDÊNCIA → CONTROLE
**Categoria:** Abstração do framework  
**Definição:** Síntese operacional transversal a qualquer metodologia de produto. O tipo de compromisso vigente determina o modo de execução; o modo determina o regime de rigor; o rigor determina o tipo de evidência exigida; a evidência viabiliza o controle. A seta não representa sequência temporal: representa a transformação progressiva do tipo de compromisso que governa o trabalho.  
**Capítulo:** Cap 2

---

### Regime de ação APRENDER → COMPROMETER → REALIZAR
**Categoria:** Abstração do framework  
**Definição:** Síntese dos três regimes de ação que organizam o trabalho de produto no ProdOps. A seta não representa sequência temporal. APRENDER: o trabalho é de redução de incerteza, fracasso de hipótese é resultado legítimo. COMPROMETER: transição formalizada pelo Commitment Gate, mudança do tipo de rigor exigido. REALIZAR: o trabalho é de honra do prometido, fracasso tem custo diferente.  
**Capítulo:** Cap 2

---

### High-Integrity Commitment
**Categoria:** Referência comparativa (Cagan/SVPG)  
**Definição:** Conceito de Cagan (SVPG) que descreve situações nas quais a organização precisa de um compromisso específico sobre uma Product Capability e uma data, assumido somente depois de investigação suficiente. O ProdOps leva essa intuição a uma estrutura operacional com o Commitment Gate, que define o mecanismo pelo qual a decisão se torna observável e operacional, com seis outcomes canônicos em vez de aprovação binária.  
**Capítulo:** Apêndice Cagan-Torres

---

### Build to Learn / Build to Earn
**Categoria:** Referência comparativa (Cagan 2026)  
**Definição:** Distinção de Cagan que diferencia construção para aprender (protótipos, experimentos) de construção de produto comercial (confiável, escalável). Distinta da distinção Upstream/Downstream do ProdOps: Build to Learn e Build to Earn descrevem o propósito da construção; Upstream e Downstream descrevem o regime de compromisso. Um trabalho Upstream pode conter construção de qualidade de produção; uma jornada Discovery pode ocorrer no Downstream.  
**Capítulo:** Apêndice Cagan-Torres
