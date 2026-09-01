# Capítulo 10: O problema de modo para agentes de IA

---

## Por que agentes não têm sensibilidade de modo por padrão

![Protocolo de classificação de modo para agentes de IA](images/cap09-agent-mode-classification.svg)
*Figura 10. Fluxo de decisão para classificação de modo: o estado do OBC é o sinal primário. OBC Committed (CommitmentGate registrado) = Downstream; OBC em Draft ou ausente = Upstream.*

Um engenheiro humano que trabalha com um framework de produto por tempo suficiente desenvolve algo que poderíamos chamar de sensibilidade de modo: a capacidade de perceber, a partir de sinais contextuais (a conversa na reunião, o estado do backlog, o tom das mensagens do PM), em que tipo de compromisso o trabalho está operando. Ele não precisa verificar formalmente se o OBC está Committed; percebe pela postura da equipe que algo foi decidido e o trabalho está agora sob compromisso.

Essa sensibilidade é valiosa. Ela permite que o rigor seja calibrado sem que cada decisão precise ser formalizada explicitamente. O problema é que ela é adquirida, não está presente no início, e não existe em agentes de IA.

Um agente de IA não acumula sensibilidade de modo através de sessões. Cada sessão começa com o contexto que lhe é fornecido (documentação, artefatos, instruções) e nada mais. O histórico de conversas de sessões anteriores não existe a menos que seja explicitamente carregado. A pressão social de uma reunião, o tom de uma mensagem no canal de Slack, a urgência implícita de um deadline: nenhum desses sinais está disponível para um agente sem instrumentação específica.

Isso não significa que agentes sejam incapazes de operar com sensibilidade de modo. Significa que a sensibilidade de modo precisa ser fornecida explicitamente: através de protocolos formalizados, interfaces de modo declaradas, e instruções que tornem verificável em que modo o trabalho está operando.

---

## Os dois modos de falha de um agente sem modo explícito

Na ausência de interface de modo explícita, agentes de IA tendem a defaultar para um de dois extremos, e ambos produzem problemas reais.

**Rigor máximo indiscriminado**: o agente trata qualquer trabalho como se fosse Downstream: aplica gates onde não cabem, exige artefatos que não existem ainda, bloqueia exploração por ausência de critérios de aceite formais. Em modo Upstream, isso é destrutivo: a disciplina do Upstream é a liberdade de explorar com rigor na evidência, não na burocracia de artefatos. Um agente que para para exigir um OBC Committed durante a exploração de uma hipótese está aplicando o rigor errado no momento errado.

**Permissividade total**: o agente trata qualquer trabalho como se fosse Upstream: executa sem verificar pré-condições, avança sem gates, implementa sem checar se o OBC está Committed ou se o BDD existe. Em modo Downstream, isso é arriscado: o compromisso foi assumido e os gates existem para protegê-lo. Um agente que implementa sem verificar o Readiness Gate está executando sem a estrutura que o compromisso exige.

Os dois modos de falha são simétricos e igualmente problemáticos. O rigor máximo indiscriminado bloqueia o aprendizado. A permissividade total destrói a rastreabilidade do compromisso. Em ambos os casos, o agente está causando dano, mas não por incompetência técnica. Por ausência de contexto de modo.

---

## O protocolo de recebimento de trabalho

O AGENTS.md do repositório da Payments API define um protocolo de recebimento de trabalho que funciona como interface de modo explícita para agentes.

O protocolo começa com uma classificação do pedido por tipo:

| Tipo de pedido | Jornada | Skill de entrada |
|---|---|---|
| Nova feature, endpoint, comportamento de negócio | Delivery | `/downstream` |
| Investigação, descoberta, análise técnica | Discovery | `/upstream` |
| Auditoria, risco, conformidade, sinal de negócio | Diligence | `/diligence` |
| Pergunta, explicação, leitura de código | nenhuma jornada | responder diretamente |

O AGENTS.md inclui uma nota explícita que é, ela mesma, evidência do problema que este capítulo descreve: "Nesta tabela, 'Discovery' é a jornada. O skill `/upstream` é o entry point da jornada Discovery executada em modo Upstream. Os modos não são jornadas: são o nível de rigor com que qualquer jornada é executada. A distinção completa está em `prodops/framework/execution-model/README.md`."

Essa nota existe porque o próprio AGENTS.md cometia o erro de usar "Jornada: Upstream", tratando Upstream como jornada em vez de modo. A contradição foi identificada no trabalho de separação formal dos modos como "contaminação conceitual": o framework usando seus próprios termos de forma inconsistente com a definição canônica.

---

## A contradição que foi identificada e parcialmente resolvida

O trabalho de separação formal entre os modos de execução identificou três tipos de contaminação conceitual no repositório:

**Contaminação estrutural**: o AGENTS.md e o `prodops/README.md` usavam "Jornada: Upstream" e "Jornada: Discovery / Upstream", mapeando Upstream como jornada em vez de modo. Um agente que lê esses documentos sem também ler `execution-model/README.md` aprende uma definição incorreta.

**Contaminação conceitual**: o `upstream/SKILL.md` mencionava "committed OBCs" e "committed BDD Features" como targets do Upstream: estados exclusivos do Downstream que o Upstream não está autorizado a exigir.

**Contaminação por ausência**: os skills de fase (Bootstrap, Hack, Sync, Finish, Ship, Validate, Promote) descreviam apenas o comportamento Downstream, sem documentar como cada fase se comporta com rigor advisory no Upstream. Um agente Upstream que quer usar o skill `/hack` no modo advisory não tem orientação sobre como fazê-lo.

A correção parcial já realizada foi a nota no AGENTS.md que esclarece a distinção entre modo e jornada. A correção completa (documentar o comportamento por modo em cada skill de fase) está planejada e ainda não concluída.

---

## Skills como interface de modo

```mermaid
graph TD
    REQ["Pedido recebido pelo agente"] --> CLASS["Classificação de modo\nPasso 0.1 do AGENTS.md"]
    CLASS -->|"OBC Committed (gate registrado)"| DS["/downstream\nRigor bloqueante\nGates obrigatórios"]
    CLASS -->|"OBC Draft / sem gate registrado"| US["/upstream\nRigor advisory\nEngenheiro decide"]
    DS --> SKILLS_DS["Bootstrap / Hack / Sync\nFinish / Ship / Validate / Promote"]
    US --> SKILLS_US["Experiment / Evidence\nDecision Package / CommitmentGate"]

    style DS fill:#FEF3C7,stroke:#F59E0B
    style US fill:#E0F2FE,stroke:#3B82F6
```

A arquitetura de skills do ProdOps resolve parte do problema de modo para agentes de uma forma elegante: cada skill de entrada implicitamente carrega um modo.

`/upstream` ativa a jornada Discovery com rigor advisory: sem gates obrigatórios, sem sequência imposta, com liberdade para o agente usar as práticas que forem úteis para responder a hipótese. O agente que invoca `/upstream` está em modo de exploração.

`/downstream` ativa a jornada Delivery com rigor bloqueante: pré-condições verificadas, sequência obrigatória, gates que impedem avanço quando não satisfeitos. O agente que invoca `/downstream` está em modo de compromisso.

O que ainda falta (e é a fronteira atual da implementação) é a documentação explícita de como cada fase individual (Bootstrap, Hack, Sync, etc.) se comporta quando invocada em modo Upstream. Um agente Upstream pode querer usar `/hack tdd` com rigor completo (ciclo Red/Green/Refactor idêntico ao Downstream), sem que isso constitua uma obrigação de ter OBC Committed ou Release Trail. O skill não documenta essa distinção ainda.

---

## O que acontece quando o contrato é explícito: o EXP-015

O EXP-015 testou uma hipótese que este capítulo formula como teoria: quando o contrato de interface é explícito e verificável, agentes de diferentes origens produzem o mesmo output.

A suite de conformidade do EXP-015 executou 22 cenários em 3 players (claude, codex, copilot). O resultado: **22/22 × 3 players — 100% de conformidade. Zero divergências semânticas entre players.**

Os 22 checks cobriram: disponibilidade da tool e descoberta do skill, emissão correta do evento Bootstrap.Started (exit code, status JSON, event-type, presença no timeline, sincronização GitHub/Datadog), emissão correta do Bootstrap.Completed, correlação entre os dois eventos, idempotência (segunda chamada com mesmo correlation-id retorna status:skipped, exit 4), rejeição de inputs inválidos (campos catalog-owned → exit 1, status:error), e sanitização de segredos (token não aparece no output nem no timeline).

O contrato em questão é a tool `prodops_emit_event` com o catálogo de eventos do ProdOps Framework. Essa tool é a interface entre o agente e o sistema operacional do framework. Quando o agente invoca a tool corretamente (com os campos obrigatórios, sem tentar sobrescrever campos catalog-owned), o output é idêntico independentemente de qual agente está executando. A intercambiabilidade não é uma propriedade dos agentes; é uma propriedade do contrato.

Uma nota de honestidade registrada no próprio relatório do EXP-015: os agentes Codex e Copilot não foram invocados diretamente. A conformidade foi verificada executando a tool com os player IDs correspondentes. A suite valida o contrato da interface, não o comportamento direto dos agentes externos. Essa transparência é ela mesma um exemplo do que o Upstream bem conduzido produz: não apenas conclusões, mas conclusões com grau de confiança declarado.

O que o EXP-015 demonstra, em linguagem do framework: quando o OBC define os Observable Events com dimensões obrigatórias (como no OBC `split-payment-pix-boleto`), e quando a tool canonicaliza a emissão desses eventos (como `prodops_emit_event`), um agente que segue o protocolo produz evidência verificável independentemente de sua origem. O problema de modo para agentes não é resolvido por treinamento dos agentes: é resolvido por contratos explícitos que os agentes leem e seguem.

## O protocolo como contexto carregado

Existe uma hipótese subjacente a este livro que os resultados do EXP-015 endereçam parcialmente: se um livro bem estruturado sobre a distinção de modos pode servir como context loading para agentes, reduzindo erros de classificação de modo.

A ideia é que um agente com acesso ao conteúdo deste livro como contexto de sessão teria a sensibilidade de modo que não é adquirida por sessões: ele saberia distinguir, a partir da descrição do trabalho, se está operando em Upstream ou Downstream, e calibraria seu rigor correspondentemente.

O EXP-015 responde um subconjunto dessa hipótese: quando o contrato de emissão de eventos é explícito e verificável, agentes convergem. O que ainda não foi testado é se a distinção conceitual entre modos (não apenas o protocolo de emissão, mas a calibração de rigor em trabalho de exploração versus trabalho de entrega) transfere-se para melhor julgamento por agentes que têm acesso ao framework como contexto. O primeiro passo está demonstrado: protocolo de recebimento de trabalho explícito e verificável, contrato de emissão de eventos com conformidade 22/22 × 3 players. O segundo passo (instrumentar os skills de fase com comportamento por modo) está planejado. O terceiro passo (verificar se o conhecimento formal sobre modos transfere-se para calibração de rigor fora do protocolo estruturado) ainda está por investigar.

---

## O que esse capítulo demonstra sobre o framework

O fato de que o próprio repositório continha contradições terminológicas sobre Upstream e Downstream não é embaraçoso: é evidência da tese central do livro.

O problema de configuração de rigor não é um problema que afeta apenas times humanos. Afeta qualquer sistema de agência (humano ou artificial) que opera com orientação fornecida por artefatos. Quando os artefatos são inconsistentes (usando "jornada" onde deveria estar "modo"), o agente aprende a distinção errada. Quando os artefatos são consistentes, o agente tem a base para calibrar o rigor corretamente.

O ProdOps, ao identificar e nomear essa contradição, e ao criar um protocolo explícito de classificação de trabalho (AGENTS.md), está resolvendo o problema de modo para agentes da única forma que funciona: tornando a distinção verificável nos próprios artefatos que os agentes leem.

---

*Capítulo 10 de 11 | Parte V: Agentes nos dois Modos*
