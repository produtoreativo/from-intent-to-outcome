# Apêndice: Notas de pesquisa — a genealogia do conceito e suas influências

---

## 1. Por que um apêndice de pesquisa

Este livro parte de uma investigação conduzida durante o desenvolvimento do framework ProdOps no contexto do projeto Procurare, uma plataforma de agentic procurement. Ao longo da escrita, diversas afirmações sobre a originalidade de conceitos como CommitmentGate, modos de execução transversais e a distinção entre Upstream e Downstream precisaram ser confrontadas com a literatura existente. Este apêndice documenta essa investigação: o que foi buscado, quais fontes foram consultadas e o que foi encontrado.

O propósito não é argumentar. O leitor que chegou até aqui já leu os argumentos dos capítulos anteriores. O propósito é transparência metodológica. Quando este livro afirma que o ProdOps é a primeira formalização dos termos upstream e downstream como modos de execução transversais, essa afirmação tem uma base investigativa. Este apêndice torna essa base visível.

A investigação cobriu oito domínios históricos nos quais os termos upstream e downstream foram usados, quatro predecessores intelectuais com influência direta sobre o framework, e dezoito obras organizadas em cinco clusters temáticos. Para cada fonte, foram mapeadas convergências com o ProdOps e divergências explícitas. O resultado é um mapa de origem intelectual, não uma lista de créditos.

Uma nota sobre o que não está aqui: fontes periféricas, menções passageiras e artigos que usam os termos de forma incidental foram consultados mas não incluídos. As referências desta seção refletem as fontes com impacto substantivo sobre o framework ou sobre a cadeia genealógica do conceito.

---

## 2. A arqueologia de duas palavras

Os termos upstream e downstream não foram criados por nenhum autor ou framework. Eles formaram-se por acumulação: cada domínio que os adotou herdou o par de palavras do domínio anterior e acrescentou uma camada de significado própria. Rastrear essa acumulação revela por que o conceito chegou ao desenvolvimento de produto com tantas interpretações simultâneas, frequentemente incompatíveis entre si.

A origem é geográfica e pré-histórica. Upstream descreve a posição a montante num fluxo de água; downstream, a posição a jusante. A distinção é puramente posicional e sequencial: quem está upstream está mais próximo da nascente, quem está downstream está mais próximo da foz. Não há julgamento de valor, nem indicação de tipo de trabalho.

A indústria do petróleo adotou o par no final do século XIX, associado à expansão da Standard Oil sob Rockefeller. Upstream passou a designar as atividades de exploração e extração; downstream, o refino, a distribuição e a venda. A lógica sequencial foi preservada: a cadeia de valor física do petróleo flui de cima para baixo, do campo à bomba de gasolina. A distinção é de posição na cadeia produtiva, não de tipo de decisão.

A biologia molecular incorporou os termos nas décadas de 1950 a 1970 para descrever a direção da transcrição genética. Upstream e downstream indicam posição relativa em relação a um gene numa cadeia de DNA, na direção em que a polimerase lê a sequência. O uso é técnico e preciso, e a sequencialidade permanece: a transcrição tem uma direção determinada pela estrutura molecular.

Em 2004, Ram Charan introduziu os termos no vocabulário de estratégia de negócios com a obra "Profitable Growth Is Everyone's Business". Upstream passou a designar as fases estratégicas do desenvolvimento de produto (ideação, pesquisa de mercado, desenvolvimento de inovação); downstream, as fases táticas (vendas, distribuição, execução). A distinção passou a ser temporal e funcional, mas a sequência foi mantida: primeiro upstream, depois downstream.

No universo do software livre, a partir dos anos 1990, upstream ganhou um sentido específico de relação de dependência entre projetos. O projeto que origina o código é upstream; o projeto que o consome ou faz fork é downstream. A distinção deixou de ser estritamente sequencial: um projeto pode ser upstream em relação a vários outros simultaneamente, sem que haja uma linha do tempo única.

David J. Anderson, no desenvolvimento do método Kanban para gestão de produtos digitais, formalizou os termos como sistemas separados por um ponto de compromisso. O Upstream Kanban gerencia opções antes do compromisso; o Downstream Kanban executa as opções comprometidas. A sequencialidade voltou: discovery é sempre upstream, entrega é sempre downstream. O output do Upstream é uma opção (um item de backlog), nunca código de produção.

Em 2020, Dan Heath publicou "Upstream: The Quest to Solve Problems Before They Happen", deslocando os termos do campo da gestão de processos para o campo da teoria causal. Upstream e downstream passaram a descrever onde numa cadeia causal uma organização intervém: upstream significa intervir na causa, antes do problema; downstream significa reagir ao sintoma, depois que o problema ocorreu. Heath foi o primeiro a romper com a ideia de que os termos descrevem quando algo acontece, propondo que descrevem onde no sistema uma ação ocorre. A sequencialidade foi preservada na cadeia causal, mas não como fase de trabalho.

O ProdOps, desenvolvido no contexto do projeto Procurare a partir de 2026, é a oitava camada. Upstream e Downstream deixam de ser posições numa cadeia, fases num processo ou orientações de intervenção causal. Passam a designar modos de execução transversais: configurações de rigor que determinam como qualquer jornada de produto é conduzida, independentemente do tipo de trabalho envolvido. A mesma jornada de Discovery, por exemplo, pode ser conduzida no modo Upstream, com rigor exploratório e compromissos mínimos, ou no modo Downstream, com rigor de entrega e compromissos formais de prazo e escopo. Essa é a primeira vez que os termos são usados dessa forma na literatura disponível.

| Camada | Domínio | Criador | Ano aprox. | Natureza da distinção | Sequencial? |
|---|---|---|---|---|---|
| 1 | Geografia física | (nenhum) | Pré-histórico | Posição relativa num fluxo de água | Sim |
| 2 | Petróleo | Standard Oil / Rockefeller | ~1870-1911 | Posição na cadeia de valor física | Sim |
| 3 | Biologia molecular | (convenção) | ~1950-1970 | Posição na direção de transcrição genética | Sim |
| 4 | Marketing/Estratégia | Ram Charan | 2004 | Fases do ciclo de produto (estratégico vs. tático) | Sim |
| 5 | Open source | (convenção) | ~1990-2000 | Relação de origem entre projetos | Parcialmente |
| 6 | Kanban/Produto digital | David J. Anderson | ~2010s | Dois sistemas separados por commitment point | Sim |
| 7 | Systems Thinking | Dan Heath | 2020 | Orientação de intervenção causal | Não |
| 8 | ProdOps | Framework do Procurare | 2026 | Modos de execução transversais com rigor como variável | Não |

O ProdOps é a primeira camada que formaliza os termos como modos de execução transversais, rompendo com a sequencialidade que todas as camadas anteriores mantêm.

---

## 3. Os predecessores intelectuais diretos

Quatro fontes exerceram influência direta e verificável sobre a estrutura conceitual do ProdOps. Cada uma contribuiu com um elemento específico e, ao mesmo tempo, apresenta uma divergência que o framework precisou superar.

### David J. Anderson e o Upstream Kanban

Anderson desenvolveu, ao longo dos anos 2010, o conceito de Upstream Kanban como sistema de gerenciamento de opções antes do compromisso de entrega. O commitment point foi definido de forma precisa: "Once a work item has moved through the commitment point, it is no longer considered optional" e "Anything to the left of that line is still an option." Essa formulação é a precursora direta do CommitmentGate do ProdOps: a fronteira nomeada que separa os dois modos, com registro formal e protocolo de transição. A teoria de Real Options (finanças), aplicada por Anderson ao gerenciamento de backlog, também influenciou o tratamento dos experimentos Upstream como opções com prazo de validade próprio.

A divergência é estrutural. No Kanban, Upstream e Downstream continuam sendo fases sequenciais. O output do Upstream é sempre um item de backlog: uma opção, nunca código de produção. No ProdOps, o modo Upstream pode produzir código de produção, desde que o compromisso formal de entrega não esteja formalizado. A distinção não é sobre o tipo de artefato produzido, mas sobre a configuração de rigor e compromisso sob a qual o trabalho é conduzido.

### Dan Heath e a orientação de intervenção

Heath, em "Upstream" (2020), propôs a distinção conceitualmente mais próxima do ProdOps entre todos os predecessores: "Downstream work is demanded of us. Upstream work is often optional" e "Organizations have a natural tendency toward downstream thinking because it's more tangible and is often rewarded." O diagnóstico de que organizações têm um viés estrutural em direção ao downstream, por conta de visibilidade e urgência, é incorporado diretamente nos anti-padrões do Downstream e nos princípios de calibração de modo do ProdOps.

A divergência também é estrutural. Heath não operacionaliza a distinção. Não há artefatos, jornadas, CommitmentGate, outcomes de gate nem rastreabilidade. A obra é diagnóstica e prescritiva em termos de orientação organizacional, não um framework de execução. Além disso, Heath não equaciona Upstream com ausência de compromisso de entrega: upstream, para ele, é prevenção causal, não modo de execução.

### Dave Snowden e o Cynefin

O Cynefin Framework (Snowden, 2007) não usa os termos upstream e downstream. Mas é o predecessor conceitual mais próximo da ideia central do ProdOps: a mesma atividade pode requerer abordagens fundamentalmente diferentes dependendo de um atributo transversal, e não de sua posição numa linha do tempo. No Cynefin, o atributo é o domínio ontológico do problema (Claro, Complicado, Complexo, Caótico). No ProdOps, o atributo é o modo de execução, determinado pelo tipo de compromisso assumido. Em ambos os casos, a natureza do trabalho não determina a abordagem: o contexto determina.

A divergência é de fundamento. No Cynefin, o domínio é determinado pela natureza do problema, algo que existe independentemente de decisões humanas. No ProdOps, o modo é determinado por uma decisão explícita: há ou não um CommitmentGate formalizado, e quais compromissos foram assumidos nele. O modo é uma escolha de governança, não uma propriedade ontológica do trabalho.

### Wnuk et al. e a evidência empírica

A pesquisa de Wnuk, Regnell e Karlsson (Universidade de Lund, 2009) analisou 3.042 decisões reais de gestão de produto de software: 875 upstream (scoping) e 2.167 downstream (change control). Os dados empíricos demonstraram que a taxa de aceitação de decisões upstream foi 77%, com lead-time modal de 3 dias; a taxa de aceitação de decisões downstream foi 59%, com lead-time modal de 1 dia. O dado mais relevante para o ProdOps: "85% of upstream decisions are made within two to three days, while downstream decisions have a mode lead-time of one day." Isso corrobora empiricamente a premissa de que o custo de reverter uma decisão é sistematicamente diferente antes e depois do compromisso formal de entrega.

---

## 4. A biblioteca que sustenta o livro

A revisão de literatura cobriu dezoito obras, organizadas em cinco clusters por área temática. Cada cluster corresponde a uma dimensão do framework sobre a qual a literatura fornece antecedentes ou evidências.

### Cluster 1: A metáfora

As obras deste cluster fornecem o pano de fundo conceitual para o uso dos termos como orientação de trabalho. Dan Heath (2020) é o exemplo principal. Eliyahu Goldratt e Jeff Cox, em "The Goal" (1984), contribuíram com a Teoria das Restrições: o ponto de contenção upstream, o modelo pull e o conceito de buffer gerenciado. O Icebox do ProdOps (reservatório de hipóteses Upstream aguardando triagem) é estruturalmente análogo a um buffer lean antes de um ponto de restrição.

### Cluster 2: Discovery de produto

Este cluster concentra as obras com maior densidade de convergência com o ProdOps. Marty Cagan, em "Inspired" (2017), formalizou os quatro riscos que precisam ser mitigados antes do compromisso de entrega: valor, usabilidade, viabilidade e factibilidade. O CommitmentGate do ProdOps opera como o momento em que o Decision Package demonstra que esses quatro riscos estão suficientemente mitigados para justificar o compromisso. Em "Empowered" (2020), Cagan e Jones propuseram que times de produto devem receber problemas, não features: Upstream é o espaço de exploração do problema; Downstream, o espaço de implementação da solução.

Teresa Torres, em "Continuous Discovery Habits" (2021), contribuiu com a Opportunity Solution Tree e o conceito de assumption testing contínuo. O Evidence Threshold do ProdOps, que determina quando a evidência acumulada num experimento Upstream é suficiente para formalizar ou descartar uma hipótese, é a formalização desse assumption testing. Ryan Singer, em "Shape Up" (2019), nomeou a distinção como Shaping (Upstream) e Building (Downstream), e introduziu o conceito de pitch que expira: experimentos Upstream têm ciclo de vida próprio e não transferem automaticamente para o Downstream.

### Cluster 3: Lean e Value Streams

Womack e Jones, em "Lean Thinking" (1996), formalizaram o conceito de value stream e a distinção entre pull e push. O Icebox como buffer lean e o CommitmentGate como puxada para o Downstream derivam diretamente dessa tradição. Rother e Shook, em "Learning to See" (1998), desenvolveram o Value Stream Mapping: as métricas TTE (Time to Evidence), TTC (Time to CommitmentGate) e TTD (Time to Deploy) do ProdOps são aplicações do VSM ao contexto de produto digital. Kim, DeBois, Willis e Humble, em "The DevOps Handbook" (2016), articularam as três dimensões do DevOps e o princípio de shift left, que o ProdOps incorpora como princípio de anteposição de validação no Upstream.

### Cluster 4: Entrega de software

Forsgren, Humble e Kim, em "Accelerate" (2018), publicaram as quatro métricas DORA como preditoras de performance organizacional. O framework ProdOps incorpora essas métricas como parte do Operational Trail do Downstream. Kim, Behr e Spafford, em "The Phoenix Project" (2013), diagnosticaram que WIP excessivo no Downstream sem controle upstream é o principal fator de degradação de fluxo. Eric Ries, em "The Lean Startup" (2011), formalizou o ciclo Build-Measure-Learn: o experimento Upstream do ProdOps é uma instância formal desse ciclo, com outcomes explícitos (incluindo pivot e descarte). Jeff Patton, em "User Story Mapping" (2014), propôs que entendimento compartilhado supera documentação: o BDD Feature do ProdOps é a versão executável desse entendimento compartilhado.

### Cluster 5: Arquitetura e DDD

Eric Evans, em "Domain-Driven Design" (2003), foi o primeiro a formalizar upstream e downstream como termos técnicos precisos em software, no contexto do Context Map. Uma relação Customer/Supplier é uma relação upstream/downstream entre bounded contexts. Vaughn Vernon, em "Implementing Domain-Driven Design" (2013), popularizou o Event Storming como ferramenta de discovery, adotado pelo ProdOps como técnica de mapeamento no Upstream. Skelton e Pais, em "Team Topologies" (2019), propuseram que times Enabling têm uma função organizacional análoga ao modo Upstream: geram capacidade exploratória que outros times consomem. O Design Council UK, com o Double Diamond (2005, revisado em 2019), produziu o modelo gráfico mais próximo da sequência Upstream-CommitmentGate-Downstream: dois diamantes (divergir e convergir no espaço do problema) seguidos de dois diamantes (divergir e convergir no espaço da solução).

### Tabela de convergências

| Conceito do ProdOps | Origem na literatura |
|---|---|
| CommitmentGate | Commitment point (Anderson) / Betting table (Singer) / Double Diamond (Design Council) |
| Modos de execução transversais | Domínios do Cynefin (Snowden) |
| Evidence Threshold | Assumption testing (Torres) |
| Icebox como buffer lean | Theory of Constraints (Goldratt) / Lean Thinking (Womack) |
| Decision Package | 4 riscos antes do compromisso (Cagan) |
| Métricas TTE, TTC, TTD | Value Stream Mapping (Rother e Shook) |
| Experimento Upstream | Build-Measure-Learn (Ries) / Pitch com expiração (Singer) |
| Bias organizacional para downstream | Diagnóstico de Heath (2020) / 4 tipos de trabalho (Kim et al.) |
| OBC como contrato vivo | Team API (Skelton e Pais) / Shared understanding (Patton) |
| Shift left de validação | DevOps Handbook (Kim et al., 2016) |

---

## 5. O que a pesquisa não encontrou

A investigação foi conduzida com a intenção explícita de identificar precedentes para cada conceito central do ProdOps. Onde precedentes foram encontrados, eles estão documentados nas seções anteriores. O que segue são as afirmações para as quais nenhum precedente foi localizado nas dezoito obras revisadas, nos quatro predecessores diretos nem em nenhuma das fontes periféricas consultadas.

Primeiro: Upstream e Downstream como modos transversais, aplicáveis a qualquer jornada de produto com configurações de rigor distintas. Todas as fontes encontradas tratam os termos como fases (sequenciais) ou como orientações de intervenção causal (Heath), nunca como configurações de rigor que atravessam qualquer tipo de jornada.

Segundo: a possibilidade de conduzir a jornada de Discovery no modo Downstream. A literatura trata Discovery como atividade intrinsecamente upstream. No ProdOps, Discovery pode ocorrer no modo Downstream quando a hipótese já está comprometida e o trabalho é de confirmação formal, não de exploração.

Terceiro: Upstream como produtor legítimo de código de produção. A literatura, sem exceção, trata o output do Upstream como descartável ou como opção de backlog. No ProdOps, código produzido em modo Upstream pode ser promovido a produção se o CommitmentGate for ativado posteriormente.

Quarto: rigor como variável primária de distinção entre os modos. A literatura usa quatro variáveis para distinguir upstream de downstream: compromisso ou opção (Anderson), fase ou estágio (Cagan, Singer), orientação de intervenção (Heath) ou posição na cadeia de dependência (Evans). Nenhuma fonte usa rigor como variável primária.

Quinto: um gate de transição com múltiplos outcomes canônicos. A literatura tende ao modelo binário (go ou no-go, commit ou não-commit). O CommitmentGate do ProdOps define seis outcomes possíveis: Comprometer, Requer outro experimento, Reduzir escopo e comprometer, Transferir responsabilidade, Descartar e registrar, e Pausar com revisão agendada. Cada outcome tem protocolo de registro distinto.

> **Nota:** os nomes dos outcomes acima refletem a formulação em uso durante o desenvolvimento inicial do framework no contexto do projeto Procurare. A nomenclatura foi revisada no framework atual; a lista canônica vigente — com nomes e definições operacionais atualizadas — está no **Capítulo 7**. A convergência conceitual é total; o que mudou foi a precisão dos nomes.

---

## 6. Referências

### Obras

ANDERSON, David J. *Kanban: Successful Evolutionary Change for Your Technology Business*. Blue Hole Press, 2010.

CAGAN, Marty. *Inspired: How to Create Tech Products Customers Love*. 2. ed. Wiley, 2017.

CAGAN, Marty; JONES, Chris. *Empowered: Ordinary People, Extraordinary Products*. Wiley, 2020.

CHARAN, Ram. *Profitable Growth Is Everyone's Business*. Crown Business, 2004.

DESIGN COUNCIL. *The Double Diamond Design Process Model*. Design Council UK, 2005 (revisado em 2019).

EVANS, Eric. *Domain-Driven Design: Tackling Complexity in the Heart of Software*. Addison-Wesley, 2003.

FORSGREN, Nicole; HUMBLE, Jez; KIM, Gene. *Accelerate: The Science of Lean Software and DevOps*. IT Revolution Press, 2018.

GOLDRATT, Eliyahu M.; COX, Jeff. *The Goal: A Process of Ongoing Improvement*. North River Press, 1984.

HEATH, Dan. *Upstream: The Quest to Solve Problems Before They Happen*. Avid Reader Press, 2020.

HUMBLE, Jez; FARLEY, David. *Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation*. Addison-Wesley, 2010.

KIM, Gene; BEHR, Kevin; SPAFFORD, George. *The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win*. IT Revolution Press, 2013.

KIM, Gene; DEBOIS, Patrick; WILLIS, John; HUMBLE, Jez. *The DevOps Handbook*. IT Revolution Press, 2016.

PATTON, Jeff. *User Story Mapping: Discover the Whole Story, Build the Right Product*. O'Reilly Media, 2014.

RIES, Eric. *The Lean Startup: How Today's Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses*. Crown Business, 2011.

ROTHER, Mike; SHOOK, John. *Learning to See: Value Stream Mapping to Add Value and Eliminate Muda*. Lean Enterprise Institute, 1998.

SINGER, Ryan. *Shape Up: Stop Running in Circles and Ship Work That Matters*. Basecamp, 2019.

SKELTON, Matthew; PAIS, Manuel. *Team Topologies: Organizing Business and Technology Teams for Fast Flow*. IT Revolution Press, 2019.

SNOWDEN, David J.; BOONE, Mary E. "A Leader's Framework for Decision Making". *Harvard Business Review*, novembro de 2007.

TORRES, Teresa. *Continuous Discovery Habits: Discover Products That Create Customer Value and Business Value*. Product Talk LLC, 2021.

VERNON, Vaughn. *Implementing Domain-Driven Design*. Addison-Wesley, 2013.

WOMACK, James P.; JONES, Daniel T. *Lean Thinking: Banish Waste and Create Wealth in Your Corporation*. Simon & Schuster, 1996.

### Artigos e papers

WNUK, Krzysztof; REGNELL, Björn; KARLSSON, Lena. "Investigating Upstream versus Downstream Decision-Making in Software Product Management". *IWSPM 2009*, IEEE, 2009.

### Fontes online relevantes

- Anderson, David J. "Upstream Kanban" (apresentação, LSSC 2012). Disponível em: leankanban.com
- Design Council UK. "The Double Diamond". Disponível em: designcouncil.org.uk
- DORA (DevOps Research and Assessment). "2023 State of DevOps Report". Disponível em: dora.dev
- Snowden, David J. "Cynefin Framework" (definição canônica). Disponível em: cynefin.io
- Singer, Ryan. "Shape Up" (edição online completa). Disponível em: basecamp.com/shapeup
- Torres, Teresa. "Continuous Discovery Habits" (blog de referência). Disponível em: producttalk.org
[← Apêndice: Corpus de Experimentos](apendice-experimentos.md)
