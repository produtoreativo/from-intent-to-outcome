# Apêndice: Corpus de Experimentos — a Magazine Siará como laboratório vivo

---

## O que é um experimento no ProdOps

No ProdOps, um experimento é a unidade estruturada de trabalho da jornada Discovery em modo Upstream. Ele não é uma reunião de brainstorming nem uma prova de conceito informal: é um artefato com hipótese falsificável, critério de parada, upstream-trail cronológico e Decision Package ao final.

Cada experimento responde a uma pergunta específica antes que qualquer compromisso Downstream seja assumido. O resultado pode ser um Decision Package que recomenda Promover (avançar para Downstream), Descartar, Aguardar decisão, ou Rodar outro experimento. O que não existe é um experimento que "passa para produção" sem CommitmentGate: o gate é a fronteira entre a exploração e o compromisso.

A Payments API da Magazine Siará acumulou 17 experimentos desde o início do desenvolvimento. Este apêndice documenta cada um deles em linguagem acessível ao leitor que não tem acesso ao repositório.

---

## Experimentos de produto

Os experimentos a seguir investigaram diretamente as capabilities da Payments API — o produto que serve os clientes da Magazine Siará.

### EXP-001 — Credit Card Lifecycle
**Status:** Concluído

**Pergunta:** Como a Payments API deve suportar o ciclo completo de cartão de crédito sem cruzar a fronteira PCI nem acoplar o Checkout diretamente ao contrato do Asaas?

**O que fez:** Antes de escrever uma linha de código de produção, especificou os seis fluxos do ciclo (autorização, confirmação, análise de risco, recusa, cancelamento, estorno) com BDD scenarios e Observable Events obrigatórios para cada um. Definiu também as dimensões que nunca poderiam aparecer nos logs: número do cartão, CVV, token do provedor.

**Resultado:** Decision Package recomendando hosted checkout como único slice autorizado para o primeiro Downstream. As demais opções (tokenizado, transparente) permanecem em Upstream aguardando decisões externas de Security e Checkout.

**Conexão com o framework:** Demonstra ODD (Observability Driven Design) no modo Upstream — o que precisa ser observável é decidido antes do código.

---

### EXP-002 — Asaas Sandbox Funding and Functional Validation
**Status:** Em andamento — bloqueado em dependência externa

**Pergunta:** O sandbox do Asaas consegue reproduzir o ciclo completo de cartão de crédito da Magazine Siará sem credenciais de produção?

**O que fez:** Mapeou as capacidades e limitações declaradas do sandbox Asaas para cada cenário do ciclo de crédito (pagamento aprovado, recusado, análise de fraude, reembolso, chargeback, retry de webhook). Confirmou o Validation Workbench como ambiente de simulação local para cenários que o sandbox não consegue reproduzir deterministicamente.

**Resultado:** Parcial. A abordagem do Validation Workbench está confirmada. A validação completa dos cenários no sandbox real do Asaas permanece em aberto — depende de execução com credenciais de sandbox e comportamento real do provedor.

**Nota de honestidade:** O experimento está formalmente em andamento porque a hipótese central (sandbox reproduz o ciclo completo?) ainda não foi respondida com evidência executável do provedor. O que está confirmado é a estratégia de simulação local.

---

### EXP-003 — Hosted vs Tokenized Credit Card
**Status:** Decision Package concluído — aguarda confirmação de UX externa

**Pergunta:** Qual dos três modelos de integração de cartão (hosted, tokenizado, transparente) vai primeiro para Downstream?

**O que fez:** Comparou os três modelos em oito dimensões: complexidade de API, PCI scope, segurança, idempotência, observabilidade, retry, experiência do usuário e complexidade operacional.

**Resultado:** Hosted checkout é o primeiro slice — menor PCI, menor risco operacional, menor mudança na arquitetura existente. Tokenizado é a segunda evolução futura. Direct Capture (raw) fora do escopo até aprovação explícita de Security.

**Conexão com o framework:** Demonstra CommitmentGate com restrição (outcome ②): apenas o slice confirmado avança; o restante permanece em Upstream.

---

### EXP-004 — Checkout Gateway Feature Flag Readiness
**Status:** Concluído (registro recuperado)

**Pergunta:** O Feature Flag do Checkout Gateway para a nova Payments API está pronto para ativação controlada, pausa e rollback?

**O que fez:** Verificou o estado do flag no Checkout e mapeou os riscos de ativação. O registro foi recuperado de referências em outros artefatos — o arquivo original foi perdido durante uma migração de estrutura.

**Resultado:** Flag bloqueada por bug identificado no Checkout. Risco documentado. Ativação dependente de correção externa.

---

### EXP-005 — Datadog Native AWS Instrumentation
**Status:** Concluído

**Pergunta:** Como manter a Payments API observável no Datadog sem criar dependência do Serverless Framework ou do serverless-offline?

**O que fez:** Validou a instrumentação via Lambda Extension Layer do Datadog integrada ao SAM (AWS Serverless Application Model) nativo, sem dependência de bibliotecas de terceiros para deploy ou validação local.

**Resultado:** SAM nativo + Lambda Extension Layer. A Payments API mantém observabilidade completa (APM, métricas customizadas, log forwarding) com deploy AWS-nativo e sandbox local via Validation Workbench.

---

### EXP-007 — Split Payment Model
**Status:** Concluído (executado em paralelo ao Downstream BS-001)

**Pergunta:** Qual é o modelo viável para suportar múltiplos meios de pagamento em um único pedido?

**O que fez:** Com BS-001 já em Downstream (DS-61 em execução com prazo de 15 dias), o time abriu este experimento em Upstream simultaneamente para aprofundar o modelo de composição. Investigou as combinações prioritárias (Pix + Boleto, Pix + Cartão), o modelo de domínio para composição de pagamento, os eventos de negócio necessários para rastrear cada combinação e a política de falha parcial — o que acontece quando um meio falha enquanto o outro já foi confirmado.

**Resultado:** Modelo de composição definido; política de falha parcial estabelecida; OBC Draft de `payment-composition` produzido. O aprendizado, incluindo código da exploração, foi promovido e integrado ao Downstream em andamento.

**Por que este caso importa:** É o exemplo mais claro de coexistência de modos no corpus. Downstream e Upstream operando em paralelo para o mesmo produto ao mesmo tempo — não em sequência, não em alternância. O Downstream manteve o compromisso assumido no CommitmentGate; o Upstream enriqueceu o modelo sem bloqueá-lo.

---

### EXP-009 — Serverless Maturity Assessment
**Status:** Em andamento

**Pergunta:** A configuração SAM atual da Payments API é madura o suficiente para escalar tráfego real de pagamentos?

**O que fez:** Avaliou a configuração AWS SAM contra melhores práticas do setor em seis dimensões: capacidade de DynamoDB, pipeline de CI/CD, observabilidade, cold start, segurança de credenciais e resiliência.

**Resultado:** Duas lacunas críticas identificadas, cada uma gerando um experimento derivado: DynamoDB em modo PROVISIONED sem Auto Scaling (risco de throttling imediato) → EXP-011. Deploy manual sem aprovação humana obrigatória → EXP-012.

**Conexão com o framework:** Demonstra o Assessment como jornada de detecção proativa — o experimento existe porque o time queria aumentar a confiança na infraestrutura *antes* de escalar, não depois de um incidente.

---

### EXP-010 — Datadog Activation in Staging
**Status:** Concluído

**Pergunta:** O Datadog funciona em staging antes de ser habilitado em produção?

**O que fez:** Ativou `DatadogEnabled=true` no ambiente de staging e validou que métricas de negócio, APM traces e log forwarding chegavam ao Datadog corretamente. A Payments API tinha toda a instrumentação no código há versões, mas com Datadog desabilitado em todos os ambientes.

**Resultado:** Métricas, traces e logs confirmados em staging. Produção passou a ter um precursor validado antes da ativação.

---

### EXP-011 — DynamoDB Optimization
**Status:** Concluído (derivado de EXP-009)

**Pergunta:** A migração do DynamoDB para PAY_PER_REQUEST elimina o risco de throttling e pode ser feita sem downtime?

**O que fez:** Validou a migração in-place via CloudFormation de PROVISIONED (1 RCU/WCU fixo) para PAY_PER_REQUEST, habilitou PITR (Point-in-Time Recovery) e removeu tabelas mortas que geravam custo sem uso.

**Resultado:** Migração bem-sucedida sem downtime. DynamoDB sem risco de throttling para volume imprevisível. Recuperação point-in-time habilitada.

---

### EXP-012 — Production CI/CD Pipeline
**Status:** Concluído (derivado de EXP-009)

**Pergunta:** GitHub Actions com environment `production` e required reviewers satisfaz os requisitos de segurança para automação do deploy em produção?

**O que fez:** Implementou pipeline com GitHub Actions, environment `production` com aprovação humana obrigatória, secrets no GitHub Environment Secrets e workflow `on: workflow_dispatch` com `confirm_changeset: true`.

**Resultado:** Deploy automatizado com aprovação humana obrigatória, audit trail de quem autorizou cada deploy, sem dependência de credenciais locais.

---

## Upstream paralelo ao Downstream: nota sobre o EXP-007

O EXP-007 merece atenção especial porque demonstra algo que a maioria dos frameworks não modela: dois regimes de compromisso diferentes operando para o mesmo produto ao mesmo tempo.

Quando BS-001 entrou em Downstream com prazo de 15 dias, o time tinha um compromisso Downstream claro e uma implementação em andamento. Mas havia questões sobre o modelo de composição de pagamento que a velocidade do CommitmentGate não havia resolvido em profundidade. Em vez de travar o Downstream ou ignorar as questões, o time abriu o EXP-007 em Upstream — com liberdade de exploração, sem gate bloqueante, sem compromisso Downstream bloqueante.

Quando o EXP-007 concluiu, o aprendizado não foi descartado: foi integrado ao Downstream. O código exploratório que havia sido produzido foi promovido e incorporado à implementação em andamento.

Isso é coexistência de modos. Não é uma exceção ao framework: é um dos seus resultados mais desejáveis.

---

## Adaptações do Framework e do Runtime

Sete experimentos do corpus não foram sobre capabilities da Payments API para os clientes da Magazine Siará. Foram sobre o próprio framework ProdOps — ajustes, validações e evoluções do modelo operacional adotado por este time.

Isso é possível e recomendado. Um time que adota o ProdOps em condições reais vai inevitavelmente encontrar lacunas, ambiguidades e oportunidades de melhoria no framework. A forma correta de tratá-las é como experimentos Upstream — com hipótese, evidência e Decision Package — não como mudanças informais.

| EXP | Nome | O que ajustou |
|---|---|---|
| 006 | Upstream Trail per Experiment | Estrutura de rastreabilidade: trail por experimento em vez de trail global único |
| 008 | DORA Extended Documentation | Plano de documentação das métricas DORA estendidas no contexto do produto |
| 013 | ProdOps Runtime Validation | Validação de que o modelo arquitetural do Framework suporta Iteration real com Runtime + Diligence + GitHub + Datadog sincronizados |
| 014 | Diligence Tracks Delivery | Demonstração de Diligence event-driven em tempo real — **53/53 PASS** |
| 015 | Delivery Skills as Event Producers | Contrato canônico de emissão de eventos por skills de qualquer player — **22/22 × 3 players PASS** |
| 016 | Operational Flow Validation | Jornada Delivery completa end-to-end com Feature Restart Protocol |
| 017 | ProdOps Addon Model | Em planejamento |

Os resultados de EXP-014 (53/53 PASS) e EXP-015 (22/22 × 3 players) são detalhados nos Capítulos 9 e 10, respectivamente, por serem as evidências empíricas mais robustas do corpus sobre Diligence contínua e o problema de modo para agentes.

---

*Apêndice | From Intent To Outcome: Upstream, Downstream e o Novo Modelo Operacional para Produtos Digitais*

---

[→ Apêndice: Notas de Pesquisa](apendice-pesquisa.md)
