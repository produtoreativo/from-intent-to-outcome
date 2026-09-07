# Apêndice: Cagan, Torres e a evolução recente do pensamento de produto

---

## 1. Uma investigação posterior ao início deste livro

Este livro começou antes das publicações mais recentes de Marty Cagan e Teresa Torres que foram analisadas nesta revisão. A arquitetura conceitual do ProdOps, a investigação sobre Upstream e Downstream e a definição de modo de execução já estavam em desenvolvimento quando Cagan publicou, em abril de 2026, a distinção entre **Build to Learn** e **Build to Earn**, e quando Torres publicou, em setembro de 2026, sua formulação prática de **AI Evals** como uma nova prática de descoberta.

Isso importa porque a relação entre essas obras e este livro não é de influência retrospectiva. As formulações do ProdOps não foram construídas a partir dessas publicações. O movimento foi o inverso: uma vez publicadas, elas foram utilizadas como material de confronto para verificar se a evolução recente do pensamento de produto alterava alguma das conclusões que este livro havia alcançado.

O resultado desse confronto é mais interessante do que uma simples afirmação de precedência.

Cagan avançou significativamente sua formulação sobre a diferença entre construir para aprender e construir para entregar valor comercial. Torres avançou a aplicação de discovery e avaliação para produtos baseados em AI. Ambos tornaram ainda mais explícita a necessidade de separar aprendizado, evidência e construção de produto comercial.

Mas nenhum dos dois introduziu uma distinção significativa que altere o que este livro define como **Upstream e Downstream**.

As novas obras aproximam-se do problema que o ProdOps procura resolver. Elas não substituem sua definição.

---

## 2. O confronto não procura estabelecer precedência

A comparação com Cagan e Torres precisa ser lida com uma cautela metodológica semelhante àquela utilizada nas demais seções deste apêndice.

O objetivo não é demonstrar que o ProdOps estava certo porque Cagan ou Torres posteriormente chegaram a conclusões semelhantes. Tampouco é atribuir aos autores uma posição que suas obras não sustentam.

A pergunta é mais simples:

> **Depois das publicações mais recentes de Cagan e Torres, ainda existe uma distinção conceitual relevante entre o que essas obras descrevem e o que o ProdOps define como Upstream e Downstream?**

A investigação indica que sim, mas a diferença não está principalmente em discovery, delivery, experimentação, evidência ou AI.

Ela está na categoria utilizada para organizar essas coisas.

Cagan continua descrevendo principalmente diferentes propósitos de construção e diferentes regimes de trabalho de produto. Torres continua descrevendo práticas para produzir e avaliar evidência durante a descoberta contínua. O ProdOps utiliza outra dimensão: **o regime de compromisso sob o qual uma jornada está sendo executada**.

Essa diferença é pequena na linguagem e grande na arquitetura do modelo.

---

## 3. Cagan: Build to Learn e Build to Earn

Em abril de 2026, Marty Cagan publicou *Build to Learn vs Build to Earn*. O texto distingue duas formas de desenvolver produto que, segundo Cagan, sempre existiram, mas que a redução do custo de construção provocada por AI tornou especialmente importante distinguir.

No **Build to Learn**, a equipe constrói para aprender. Protótipos, experimentos e outras formas de construção servem para descobrir uma solução que valha a pena construir. No **Build to Earn**, a equipe constrói produto comercial: algo confiável, escalável, performático e suficientemente completo para que clientes possam depender dele.

A formulação é diretamente relevante para este livro porque elimina uma interpretação equivocada que a disponibilidade de AI poderia produzir: se construir ficou barato, então a resposta não é simplesmente construir mais rápido e descobrir o resultado em produção. O problema passa a ser distinguir o propósito da construção.

Cagan afirma que, no product model, a equipe primeiro procura uma solução que valha a pena construir e somente depois constrói e entrega essa solução. Em seu texto posterior sobre o chamado *AI Productivity Paradox*, ele reforça a mesma distinção: organizações podem usar AI para produzir artefatos mais rapidamente sem produzir melhores resultados, porque o problema não está necessariamente no custo ou na velocidade da construção, mas na frequência com que se constroem ideias que não deveriam ter sido construídas.

A convergência com o ProdOps é inequívoca.

O ProdOps também distingue o trabalho cujo propósito é produzir conhecimento do trabalho que precisa honrar um compromisso de produto. O Upstream permite investigação, experimentação, prototipação e produção de evidência sem que o resultado esteja necessariamente submetido ao regime bloqueante do Downstream.

Mas a definição não é a mesma.

**Build to Learn e Build to Earn descrevem o propósito da construção. Upstream e Downstream descrevem o regime de compromisso sob o qual o trabalho é realizado.**

Essa diferença impede uma equivalência direta.

Um trabalho realizado em Upstream pode conter construção. Pode conter código de qualidade de produção. Pode inclusive resultar em uma implantação controlada. O que permanece ausente é o compromisso formal de que aquela Product Capability, com aquele comportamento, será sustentada como entrega comprometida.

Da mesma forma, Discovery não é ontologicamente Upstream. A Discovery pode continuar depois que um compromisso foi assumido, quando seu propósito é resolver incertezas residuais dentro de um regime bloqueante. Delivery também não é ontologicamente Downstream. Uma equipe pode construir para aprender sem que a construção constitua ainda um compromisso de entrega.

A publicação de Cagan reforça, portanto, a necessidade da distinção do ProdOps sem substituí-la.

Fonte: [Marty Cagan — Build to Learn vs Build to Earn](https://www.svpg.com/build-to-learn-vs-build-to-earn/).

Fonte: [Marty Cagan — Build To Learn FAQ](https://www.svpg.com/build-to-learn-faq/).

Fonte: [Marty Cagan — The AI Productivity Paradox](https://www.svpg.com/the-ai-productivity-paradox/).

---

## 4. O AI Productivity Paradox e o problema que o ProdOps já havia isolado

A publicação de julho de 2026 sobre o *AI Productivity Paradox* tornou mais explícita uma consequência da AI que interessa diretamente ao argumento deste livro.

Se AI reduz o custo de produção de software, a velocidade de construção deixa de ser uma proteção contra desperdício. É possível construir muito rapidamente a coisa errada.

Cagan descreve a diferença entre organizações que utilizam AI para acelerar a produção dos artefatos do antigo modelo de projeto e organizações que utilizam AI para acelerar a descoberta de soluções capazes de produzir resultados para clientes e para o negócio. Somente depois da evidência e da confiança suficientes essas equipes utilizam AI para acelerar a construção comercial.

Essa formulação converge fortemente com a tese de que a velocidade de Delivery não resolve, por si só, o problema de produto.

O ProdOps acrescenta uma pergunta que não é respondida pela distinção Build to Learn / Build to Earn:

> **Em que regime de compromisso essa construção está ocorrendo?**

Essa pergunta permite distinguir dois trabalhos tecnicamente semelhantes.

Em ambos os casos pode haver código, testes, deploy, observabilidade e usuários reais. Em um caso, o trabalho pode permanecer reversível e não bloqueante. No outro, pode existir um compromisso formal cuja violação exige uma decisão explícita sobre o compromisso vigente.

A diferença não está no artefato produzido.

Está na obrigação que o sistema de trabalho assumiu sobre ele.

É precisamente por isso que o Capítulo 3 define o modo como uma configuração de compromisso, e não como uma classificação do tipo de trabalho. A jornada define o trabalho; o modo define o compromisso; o Gate define a condição de avanço.

---

## 5. Cagan e o High-Integrity Commitment

A aproximação mais antiga entre Cagan e a tese do ProdOps está na ideia de **High-Integrity Commitment**.

Cagan já havia estabelecido que a maior parte dos objetivos de uma equipe de produto deve permanecer orientada a resultados e sujeita à incerteza. Existem, entretanto, situações nas quais a organização precisa de um compromisso específico sobre uma Product Capability e uma data. Nesses casos, o compromisso deve ser assumido somente depois de investigação suficiente para produzir confiança sobre valor, usabilidade, viabilidade e factibilidade.

Essa formulação é anterior a este livro e não deve ser apresentada como uma descoberta recente de 2026.

O que mudou recentemente é a forma como Cagan conecta essa distinção à AI: quando a construção se torna mais barata, a investigação que precede um compromisso torna-se ainda mais importante.

O ProdOps leva essa intuição a uma estrutura operacional diferente.

Um High-Integrity Commitment descreve uma condição de negócio e de gestão na qual uma promessa precisa ser confiável. O **Commitment Gate** descreve o mecanismo pelo qual uma organização decide formalmente o destino de uma Product Capability a partir da evidência disponível.

A diferença pode ser resumida assim:

> **High-Integrity Commitment explica por que determinados compromissos exigem confiança especial. Commitment Gate define como a decisão de assumir esse compromisso se torna observável e operacional.**

O Commitment Gate também não é uma simples aprovação. Seus outcomes canônicos incluem Promover, Promover com restrição, Requerer outro experimento, Aguardar decisão de negócio, Aguardar dependência externa e Descartar. O objetivo é registrar o destino da Product Capability, inclusive quando esse destino não é a promoção.

A convergência é forte. A estrutura operacional é diferente.

Fonte: [Marty Cagan — Team Objectives: Commitments](https://www.svpg.com/team-objectives-commitments/).

Fonte: [Marty Cagan — High-Integrity Commitments](https://www.svpg.com/managing-commitments-in-an-agile-team/).

Fonte: [Marty Cagan — Stakeholders and the Product Model](https://www.svpg.com/stakeholders-and-the-product-model/).

---

## 6. Torres: discovery contínua e AI Evals

Teresa Torres percorreu uma trajetória diferente.

*Continuous Discovery Habits* estabeleceu uma disciplina para manter discovery contínua, baseada em contato frequente com clientes, mapeamento de oportunidades e teste sistemático de suposições. Em 2026, Torres voltou a esse material durante o ciclo de cinco anos do livro e, ao mesmo tempo, passou a tratar de maneira mais explícita o impacto da AI sobre as práticas de produto.

Em março de 2026, ao discutir gestão de stakeholders em produtos com AI, Torres chamou atenção para um risco que se tornou mais agudo com a redução do custo de construção: equipes podem voltar a uma feature factory porque ficou fácil adicionar AI ao roadmap e fácil produzir protótipos. A recomendação continua sendo testar as suposições e verificar se a AI realmente resolve o problema do cliente.

Em setembro de 2026, Torres publicou *AI Evals: A Hands-On Guide for Product Teams*. O artigo apresenta evals como métodos para medir se um produto ou workflow de AI está funcionando conforme esperado. Torres também retoma sua formulação anterior de que evals podem constituir uma nova prática de discovery.

A convergência com o ProdOps é igualmente forte.

O ProdOps também trata evidência como elemento estrutural da tomada de decisão. O Upstream possui hipótese, evidência, critérios de parada, Decision Package e Commitment Gate. O Downstream utiliza evidência para verificar que as condições de um compromisso foram satisfeitas. O Runtime continua produzindo evidência depois da promoção.

Mas novamente não existe equivalência ontológica.

**Um eval não é necessariamente Upstream.**

Ele pode ser usado para investigar uma hipótese antes do compromisso. Pode ser usado para verificar uma condição de uma Product Capability comprometida. Pode ser utilizado em operação para detectar regressões. Pode fazer parte de Assessment ou Diligence.

O que determina sua função não é o fato de ser um eval.

É o compromisso ao qual a evidência está relacionada.

Essa distinção é particularmente importante para produtos AI porque os mesmos mecanismos de avaliação podem atravessar todo o ciclo de vida. Uma avaliação que inicialmente serviu para reduzir incerteza pode tornar-se parte do mecanismo de verificação de uma Product Capability comprometida. A ferramenta é a mesma. A função epistemológica e operacional mudou.

Fonte: [Teresa Torres — AI Evals: A Hands-On Guide for Product Teams](https://www.producttalk.org/ai-evals/).

Fonte: [Teresa Torres — Stakeholder Management for Product Teams: Show Your Work, Don't Sell Your Conclusions](https://www.producttalk.org/stakeholder-management/).

Fonte: [Teresa Torres — Product Talk](https://www.producttalk.org/).

---

## 7. O que mudou nos autores e o que não mudou no ProdOps

O confronto com as publicações recentes permite separar três níveis diferentes de convergência.

### 7.1 O diagnóstico convergiu

Cagan e Torres tornaram ainda mais explícito que a redução do custo de construção não elimina o problema de produto. Ao contrário: ela pode amplificá-lo. Construir a coisa errada ficou mais barato e mais rápido.

O ProdOps já parte desse problema ao distinguir o regime de exploração do regime de compromisso e ao tratar a transição entre eles como algo que precisa ser observável.

### 7.2 A importância da evidência convergiu

Cagan enfatiza evidência e confiança suficientes antes de construir para entregar. Torres amplia o uso de avaliação e evidência para produtos AI.

O ProdOps também coloca evidência no centro, mas atribui papéis diferentes à evidência conforme o modo. No Upstream, ela reduz incerteza e sustenta decisão. No Downstream, ela verifica a realização das condições do compromisso. No Runtime, ela alimenta a compreensão operacional do comportamento real.

### 7.3 A definição de Upstream e Downstream não convergiu para uma nova alternativa

Este é o resultado mais importante da investigação.

Nenhuma das publicações analisadas de Cagan ou Torres propõe uma definição de Upstream e Downstream que substitua a definição canônica do ProdOps.

Cagan continua trabalhando principalmente com distinções como:

- Build to Learn;
- Build to Earn;
- Product Discovery;
- Product Delivery;
- Product Model;
- Project Model;
- High-Integrity Commitment.

Torres continua trabalhando principalmente com:

- Continuous Discovery;
- Opportunity Solution Trees;
- Assumption Testing;
- AI Evals;
- evidência para decisões de produto.

Essas categorias se relacionam fortemente com o modelo do ProdOps, mas não produzem a mesma ontologia.

Não há, portanto, uma distinção significativa nas obras recentes que exija alterar o que este livro define como Upstream e Downstream.

---

## 8. A diferença precisa ser preservada

Seria fácil, depois dessas publicações, reescrever o livro dizendo que:

> Upstream é Build to Learn.

ou:

> Downstream é Build to Earn.

Essa simplificação seria um retrocesso.

Ela transformaria novamente os modos em tipos de trabalho e recolocaria o problema que o Capítulo 3 procura eliminar.

Build to Learn pode acontecer em Upstream. Mas uma equipe também pode produzir conhecimento durante um trabalho Downstream, quando precisa resolver uma incerteza residual dentro de um compromisso existente.

Build to Earn tende a exigir Downstream, porque produto comercial exige um regime no qual qualidade, confiabilidade e comportamento comprometido possam ser verificados. Mas construção para aprender também pode produzir software implantável, inclusive em produção controlada, sem que isso transforme automaticamente o trabalho em Downstream.

Da mesma maneira, um eval pode ser usado no Upstream ou no Downstream. Uma sessão de Discovery pode ocorrer nos dois modos. Delivery pode ocorrer nos dois modos. Operation pode ocorrer nos dois modos.

O modo não classifica o trabalho.

O modo classifica o **regime de compromisso** sob o qual o trabalho está sendo realizado.

Essa formulação continua sendo a distinção que melhor explica o modelo do ProdOps depois do confronto com as publicações recentes.

---

## 9. A contribuição específica do ProdOps fica mais nítida

A comparação com Cagan e Torres não diminui a importância de seus modelos. Ela ajuda a localizar o ProdOps em uma camada diferente.

Cagan explica como uma organização pode sair do modelo de projeto e construir produtos orientados a problemas e resultados. Sua formulação recente mostra por que AI torna essa distinção ainda mais importante.

Torres explica como equipes podem manter discovery contínua e, no caso de AI, como utilizar evals para transformar comportamento observado em evidência e aprendizado.

O ProdOps procura responder a uma pergunta operacional que permanece entre essas duas preocupações:

> **Como o sistema de trabalho sabe qual regime de compromisso está vigente e quais condições precisam ser satisfeitas antes de avançar?**

Essa pergunta produz os mecanismos que aparecem ao longo deste livro:

- modo de execução;
- Commitment Gate;
- Readiness Gate;
- OBC;
- Decision Package;
- Evidence Package;
- Release Trail;
- Runtime;
- Diligence.

Esses mecanismos não são alternativas a discovery, delivery ou evals. Eles procuram tornar o sistema no qual essas práticas acontecem observável e governável.

---

## 10. A consequência para agentes de AI

A comparação ganha uma dimensão adicional quando o objeto de trabalho deixa de ser apenas uma equipe humana e passa a incluir agentes.

Um profissional experiente pode perceber contextualmente que está trabalhando em um protótipo, que uma mudança ainda é reversível ou que uma decisão já constituiu uma promessa para a organização. Um agente precisa receber essas condições de forma muito mais explícita.

A questão operacional passa a ser:

> **O agente sabe qual compromisso está autorizado a manter?**

Isso exige distinguir pelo menos quatro coisas que frequentemente aparecem misturadas em sistemas agentic:

1. o Intent que originou o trabalho;
2. o compromisso vigente;
3. o modo de execução;
4. as condições de avanço e as evidências exigidas.

Um agente que possui apenas instruções sobre como executar uma tarefa pode produzir uma solução tecnicamente correta e ainda assim agir fora do regime de compromisso autorizado.

É nesse ponto que a definição modal do ProdOps ganha uma consequência que não depende de AI, mas que se torna muito mais importante por causa dela.

**O modo precisa ser uma propriedade observável do trabalho, não apenas uma convenção na cabeça do time.**

Se o trabalho está em Upstream, o agente pode ser autorizado a explorar, testar hipóteses, produzir evidência e até construir protótipos sem que cada ação seja tratada como cumprimento de uma promessa de produção.

Se o trabalho está em Downstream, as condições obrigatórias precisam ser verificáveis e as ações do agente precisam respeitar o compromisso vigente.

A AI não cria a necessidade do modelo modal.

Ela torna o custo de não possuí-lo mais evidente.

---

## 11. O resultado da revisão

O confronto com as publicações de 2026 produz quatro conclusões.

**Primeira:** Cagan avançou sua formulação sobre a diferença entre aprender construindo e construir para entregar produto comercial. Essa formulação reforça o problema que o ProdOps procura resolver, mas não redefine Upstream e Downstream como modos transversais.

**Segunda:** Cagan continua tratando compromissos de alta integridade como exceções que exigem investigação suficiente e confiança elevada. O ProdOps transforma a passagem para esse regime de compromisso em um mecanismo explícito, o Commitment Gate, sem reduzir o Gate a uma aprovação binária.

**Terceira:** Torres avançou a aplicação de evidência e avaliação para produtos AI, tratando evals como uma prática relevante de discovery e de controle de qualidade. Isso reforça a tese de que evidência atravessa o ciclo de vida do produto. Não transforma eval em sinônimo de Upstream nem Discovery em definição de Upstream.

**Quarta:** não foi encontrada, nas obras recentes analisadas, uma distinção significativa que altere a definição de Upstream e Downstream adotada pelo ProdOps. A literatura recente converge para a importância de distinguir aprendizado, evidência, construção e compromisso. O ProdOps acrescenta a formalização do compromisso como variável que determina o regime de execução.

Essa última distinção é a que este livro precisa preservar.

---

## 12. Estado da evidência

A classificação desta revisão é deliberadamente conservadora.

| Afirmação | Evidência | Status |
|---|---|---|
| AI reduziu o custo e aumentou a velocidade de construção | Cagan, *Build to Learn vs Build to Earn*; *AI Productivity Paradox* | Demonstrado como tese dos autores |
| Construir mais rápido não garante melhores outcomes | Cagan, *AI Productivity Paradox*; Torres, *Stakeholder Management* | Fortemente suportado |
| Build to Learn e Build to Earn são distinções relevantes na era AI | Cagan, 2026 | Demonstrado como posição de Cagan |
| AI Evals são relevantes para equipes de produto | Torres, 2026 | Demonstrado como posição de Torres |
| Evals podem funcionar como prática de discovery | Torres, 2026 | Demonstrado como posição de Torres |
| Evidência deve preceder compromissos de alta integridade | Cagan, High-Integrity Commitments | Fortemente suportado |
| Upstream e Downstream são modos transversais definidos pelo regime de compromisso | Framework ProdOps e capítulos deste livro | Canonizado no modelo do livro |
| Build to Learn = Upstream | Comparação entre as obras | Não demonstrado; a equivalência é inadequada |
| Build to Earn = Downstream | Comparação entre as obras | Não demonstrado como equivalência ontológica |
| Discovery = Upstream | Comparação entre as obras | Não demonstrado |
| Delivery = Downstream | Comparação entre as obras | Não demonstrado |
| Evals = Upstream | Comparação entre as obras | Não demonstrado |
| As publicações recentes de Cagan e Torres redefiniram Upstream/Downstream | Revisão das fontes analisadas | Não encontrado |

---

## 13. Referências consultadas

### Marty Cagan

- [Build to Learn vs Build to Earn](https://www.svpg.com/build-to-learn-vs-build-to-earn/) — abril de 2026.
- [Build To Learn FAQ](https://www.svpg.com/build-to-learn-faq/) — abril de 2026.
- [The AI Productivity Paradox](https://www.svpg.com/the-ai-productivity-paradox/) — julho de 2026.
- [A Fresh Definition of The Product Role](https://www.svpg.com/a-fresh-definition-of-the-product-role/) — agosto de 2026.
- [Stakeholders and the Product Model](https://www.svpg.com/stakeholders-and-the-product-model/) — 2025.
- [Team Objectives — Commitments](https://www.svpg.com/team-objectives-commitments/) — referência sobre High-Integrity Commitments.
- [High-Integrity Commitments](https://www.svpg.com/managing-commitments-in-an-agile-team/) — referência histórica sobre compromissos de alta integridade.

### Teresa Torres

- [AI Evals: A Hands-On Guide for Product Teams](https://www.producttalk.org/ai-evals/) — setembro de 2026.
- [Stakeholder Management for Product Teams: Show Your Work, Don't Sell Your Conclusions](https://www.producttalk.org/stakeholder-management/) — março de 2026.
- [Product Talk](https://www.producttalk.org/) — arquivo de publicações e materiais de Continuous Discovery.

---

## 14. Conclusão metodológica

A investigação não encontrou razão para revisar a ontologia central do livro em função das publicações recentes de Cagan e Torres.

Encontrou, entretanto, uma razão para torná-la mais explícita.

Quanto mais a AI reduz o custo de construir, mais insuficiente se torna organizar o sistema de produto apenas em torno da distinção entre discovery e delivery. Quanto mais avaliações e evidências passam a atravessar o ciclo de vida, menos útil se torna tratá-las como propriedade exclusiva de discovery. Quanto mais agentes participam da execução, mais importante se torna tornar explícito o regime de compromisso no qual cada ação é autorizada.

O movimento recente da literatura de produto, portanto, não elimina a distinção proposta neste livro.

Ele aumenta sua necessidade.

O problema deixa de ser apenas **como descobrir o que construir**.

Passa a incluir **como saber o que estamos autorizados a comprometer enquanto descobrimos, construímos, operamos e avaliamos**.

É nesse espaço que Upstream e Downstream, entendidos como modos de execução e não como fases, permanecem uma distinção necessária do modelo operacional de produto.
