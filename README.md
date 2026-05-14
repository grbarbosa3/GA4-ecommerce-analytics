<img width="1426" height="808" alt="image" src="https://github.com/user-attachments/assets/dd4ba62a-dc49-4ba3-9380-36d3f08c4f16" />

# GA4 E-commerce Analytics com BigQuery
#### GA4 E-commerce Analytics using BigQuery

##### 🇺🇸 *English version below* ⬇️

## Visão geral

Este projeto tem como objetivo tratar e analisar a base pública de eventos do **Google Analytics 4 (GA4)** no **BigQuery**, transformando dados brutos de navegação e compra em informações analíticas mais claras para tomada de decisão.

A proposta foi sair de uma estrutura de eventos bruta e aninhada, comum em exportações do GA4, e construir uma camada analítica mais legível para exploração de métricas de negócio em um contexto de e-commerce.

O resultado final foi um dashboard em **Power BI** com foco em visão executiva, performance de produtos e tendências diárias.

---

## Objetivo do projeto

Tratar a base pública do GA4 no BigQuery para responder perguntas de negócio relacionadas a:

- comportamento de usuários
- volume de sessões
- receita
- pedidos
- conversão
- desempenho de produtos
- evolução diária das métricas
- progressão no funil de compra

---

## Fonte de dados

Dataset público do BigQuery com eventos de e-commerce em GA4:

- `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

---

## Stack utilizada

- **BigQuery**
- **SQL**
- **Power BI**

---

## Etapas do trabalho

### 1. Exploração da base bruta

A base original foi analisada diretamente no BigQuery para entender sua estrutura de eventos, parâmetros aninhados e itens de produto.

<img width="1424" height="699" alt="image" src="https://github.com/user-attachments/assets/81398a6c-be46-4a2e-b942-4457c334c1c1" />

### 2. Tratamento dos dados

<img width="292" height="242" alt="image" src="https://github.com/user-attachments/assets/f369868b-3d70-4542-9518-4b1166b91dfa" />

Foram criadas tabelas de apoio no BigQuery para organizar os dados em camadas mais utilizáveis:

**Camada raw**
- `events_base`
- `items_base`
- 
<img width="285" height="92" alt="image" src="https://github.com/user-attachments/assets/4f7de12a-570a-45b9-bd47-29af44d6cd6e" />

**Camada analytics**
- `daily_kpis`
- `product_performance`
- `funnel_summary`
- `overview_summary`

<img width="299" height="157" alt="image" src="https://github.com/user-attachments/assets/fb5e3c92-5be4-48f9-8b43-3bb172452a2e" />
  
### 3. Visualização
As tabelas analíticas foram conectadas ao Power BI para construção do dashboard final.
*Visão Geral*

<img width="1426" height="808" alt="image" src="https://github.com/user-attachments/assets/dd4ba62a-dc49-4ba3-9380-36d3f08c4f16" />

*Análise de Produtos*

<img width="1430" height="809" alt="image" src="https://github.com/user-attachments/assets/a49f92ba-3548-4408-a50b-accba760204a" />

*Tendência Diária*

<img width="1431" height="807" alt="image" src="https://github.com/user-attachments/assets/d846f9d5-56ec-407e-919d-0ea34ba75088" />

---

## Perguntas de negócio respondidas

O dashboard foi estruturado para responder perguntas como:

### Visão executiva
- Quantos usuários acessaram a loja no período?
- Quantas sessões foram registradas?
- Qual foi a receita total?
- Quantos page views ocorreram?
- Quantos pedidos foram realizados?
- Qual foi a taxa de conversão do período?
- Como a receita evoluiu ao longo do tempo?
- Como os usuários avançaram pelo funil de compra?
- Quais foram os produtos com maior receita?

### Performance de produtos
- Quais produtos tiveram mais visualizações?
- Quais produtos receberam mais eventos de add to cart?
- Quais produtos foram mais comprados?
- Quais produtos geraram mais receita?
- Quais produtos venderam mais unidades?
- Como as marcas performaram em visualizações, add to cart, compras e receita?

### Tendência diária
- Qual foi a média diária de usuários?
- Qual foi a média diária de sessões?
- Qual foi a média diária de receita?
- Qual foi a média diária de page views?
- Qual foi a média diária de pedidos?
- Qual foi a média diária de conversão?
- Como page views, pedidos e usuários variaram ao longo do tempo?

---

## Estrutura analítica criada

### `events_base`
Tabela base de eventos tratada a partir do dataset bruto do GA4, com campos essenciais como:
- data do evento
- timestamp
- nome do evento
- usuário
- sessão
- página
- país
- receita de compra
- transaction_id

### `items_base`
Tabela de itens extraída de eventos relacionados a produto, com campos como:
- item_id
- item_name
- item_brand
- item_category
- price
- quantity

### `daily_kpis`
Tabela com indicadores diários para análise temporal:
- users
- sessions
- page_views
- orders
- revenue
- conversion_rate_pct

### `product_performance`
Tabela com métricas por produto:
- visualizações
- add to cart
- compras
- unidades vendidas
- receita por produto

### `funnel_summary`
Resumo das etapas principais do funil:
- `view_item`
- `add_to_cart`
- `begin_checkout`
- `purchase`

### `overview_summary`
Resumo consolidado do período com os principais KPIs:
- total_users
- total_sessions
- total_page_views
- total_orders
- total_revenue
- conversion_rate_pct

---

## Principais insights explorados

- A base do GA4 exige tratamento prévio para se tornar útil em análises de negócio
- Eventos e parâmetros aninhados precisam ser extraídos e organizados em estruturas mais limpas
- A jornada de compra pode ser analisada de forma objetiva a partir dos eventos principais
- Produtos podem ser avaliados por interesse, intenção e conversão
- A combinação entre BigQuery e Power BI permite transformar uma base bruta em uma visualização clara e executiva

---

## Dashboard

O dashboard foi dividido em 3 páginas principais:

### 1. Executive Overview
Visão geral das métricas principais, linha de receita, funil de compra e top produtos por receita.

### 2. Product Performance
Análise detalhada dos produtos mais vistos, adicionados ao carrinho, comprados, mais rentáveis e marcas com melhor desempenho.

### 3. Daily Trend
Análise de tendência diária de usuários, sessões, receita, pedidos, page views e conversão.

---

## Aprendizados

Com este projeto, pratiquei:

- modelagem analítica em BigQuery
- tratamento de dados brutos do GA4
- extração de campos aninhados com SQL
- criação de tabelas analíticas orientadas a negócio
- construção de dashboard executivo em Power BI

---

## Próximos passos

- evoluir a transformação com **dbt**
- orquestrar o fluxo com **Kestra**
- documentar as camadas do pipeline
- publicar o projeto com screenshots e arquitetura visual

---

## English Version 🇺🇸

## Overview

This project was built to clean and analyze the public **Google Analytics 4 (GA4)** e-commerce dataset in **BigQuery**, transforming raw navigation and purchase events into clearer business-facing analytical tables.

The main goal was to move from a raw and nested GA4 event structure to a more readable analytical layer that supports e-commerce insights and dashboarding.

The final result is a **Power BI** dashboard focused on executive metrics, product performance, and daily trends.

---

## Project goal

Clean and structure the public GA4 dataset in BigQuery in order to answer business questions related to:

- user behavior
- sessions
- revenue
- orders
- conversion
- product performance
- daily trends
- purchase funnel progression

---

## Data source

Public BigQuery dataset with GA4 e-commerce events:

- `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

---

## Tech stack

- **BigQuery**
- **SQL**
- **Power BI**

---

## Project steps

### 1. Raw data exploration
The original dataset was explored directly in BigQuery to understand its event-based structure, nested parameters, and product item data.

### 2. Data transformation
Supporting analytical tables were created in BigQuery to organize the data into cleaner layers:

**Raw layer**
- `events_base`
- `items_base`

**Analytics layer**
- `daily_kpis`
- `product_performance`
- `funnel_summary`
- `overview_summary`

### 3. Visualization
The analytical tables were connected to Power BI to build the final dashboard.

---

## Business questions answered

The dashboard was designed to answer questions such as:

### Executive overview
- How many users visited the store during the selected period?
- How many sessions were recorded?
- What was the total revenue?
- How many page views were generated?
- How many orders were completed?
- What was the overall conversion rate?
- How did revenue change over time?
- How did users move through the purchase funnel?
- Which products generated the most revenue?

### Product performance
- Which products had the highest number of views?
- Which products had the most add to cart events?
- Which products were purchased the most?
- Which products generated the highest revenue?
- Which products sold the most units?
- How did each brand perform in views, add to cart, purchases, and revenue?

### Daily trend
- What was the average daily number of users?
- What was the average daily number of sessions?
- What was the average daily revenue?
- What was the average daily number of page views?
- What was the average daily number of orders?
- What was the average daily conversion rate?
- How did page views, orders, and users change over time?

---

## Analytical tables created

### `events_base`
Base event table cleaned from the raw GA4 dataset, including fields such as:
- event date
- event timestamp
- event name
- user
- session
- page
- country
- purchase revenue
- transaction_id

### `items_base`
Item-level table extracted from product-related events, including:
- item_id
- item_name
- item_brand
- item_category
- price
- quantity

### `daily_kpis`
Daily KPI table for time-based analysis:
- users
- sessions
- page_views
- orders
- revenue
- conversion_rate_pct

### `product_performance`
Product-level performance table with metrics such as:
- views
- add to cart
- purchases
- items sold
- product revenue

### `funnel_summary`
Summary of the main purchase funnel steps:
- `view_item`
- `add_to_cart`
- `begin_checkout`
- `purchase`

### `overview_summary`
Single summary table with the main business KPIs for the full period:
- total_users
- total_sessions
- total_page_views
- total_orders
- total_revenue
- conversion_rate_pct

---

## Main insights explored

- GA4 raw data requires cleaning before becoming useful for business analysis
- Nested fields and parameters need to be extracted and organized into readable structures
- The purchase journey can be analyzed through the main event steps
- Products can be evaluated through interest, intent, and conversion metrics
- BigQuery combined with Power BI makes it possible to turn raw event data into a clear executive dashboard

---

## Dashboard

The dashboard was organized into 3 main pages:

### 1. Executive Overview
High-level KPIs, revenue timeline, purchase funnel, and top products by revenue.

### 2. Product Performance
Detailed view of the most viewed, most added to cart, most purchased, top revenue products, and best-performing brands.

### 3. Daily Trend
Daily trend analysis of users, sessions, revenue, orders, page views, and conversion.

---

## What I practiced

With this project, I practiced:

- analytical modeling in BigQuery
- cleaning raw GA4 data
- extracting nested GA4 fields with SQL
- building business-oriented analytical tables
- creating an executive dashboard in Power BI

---

## Next steps

- evolve transformations using **dbt**
- orchestrate the workflow with **Kestra**
- document the pipeline layers
- publish the project with screenshots and architecture diagrams
