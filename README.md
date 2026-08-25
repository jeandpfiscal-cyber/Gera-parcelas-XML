# Parcelas NF-e → Domínio

App em Streamlit que lê XMLs de NF-e de entrada, extrai as parcelas
(duplicatas) e gera a planilha no layout exigido para importação no
Domínio.

## Rodando localmente (Windows)

1. Instale o Python (python.org), marcando "Add to PATH" na instalação.
2. Abra `.streamlit/secrets.toml` e troque `troque-esta-senha` pela senha
   que vocês querem usar no escritório.
3. Dê dois cliques em `iniciar_app.bat`.
4. O app vai pedir essa senha antes de liberar o uso.

## Publicando online (GitHub + Streamlit Community Cloud)

### 1. Criar o repositório no GitHub

1. Acesse github.com e crie uma conta (se ainda não tiver).
2. Clique em **New repository**.
3. Dê um nome (ex.: `parcelas-nfe-dominio`) e marque como **Private**
   (recomendado, já que o app processa notas fiscais da empresa).
4. Suba todos os arquivos desta pasta para o repositório — pelo site do
   GitHub mesmo (botão "Add file" → "Upload files") ou via linha de
   comando:

   ```bash
   git init
   git add .
   git commit -m "Primeira versão do app de parcelas"
   git branch -M main
   git remote add origin https://github.com/SEU-USUARIO/parcelas-nfe-dominio.git
   git push -u origin main
   ```

**Importante:** o arquivo `.streamlit/secrets.toml` está no `.gitignore` de
propósito — ele **não** deve ir pro GitHub, porque teria a senha em texto
puro num repositório. A senha é configurada separadamente no painel do
Streamlit Cloud (passo 4 abaixo).

### 2. Publicar no Streamlit Community Cloud

1. Acesse **share.streamlit.io** e entre com sua conta do GitHub.
2. Clique em **New app**.
3. Selecione o repositório, a branch (`main`) e o arquivo principal
   (`app.py`).
4. Antes (ou depois) de clicar em Deploy, vá em **Advanced settings → Secrets**
   e cole:
   ```toml
   app_password = "a-senha-que-vocês-vão-usar"
   ```
5. Clique em **Deploy**. Em alguns minutos você recebe uma URL do tipo
   `https://parcelas-nfe-dominio.streamlit.app`.
6. Compartilhe essa URL e a senha com os colegas do escritório que forem
   usar o app (por um canal separado, não pelo mesmo link).

Se quiser trocar a senha depois, edite em **App → Settings → Secrets** no
painel do Streamlit Cloud e reinicie o app ("Reboot app").

### 3. Atualizações futuras

Sempre que você alterar o código e der `git push`, o app publicado é
atualizado automaticamente — não precisa reimplantar manualmente.

## Sobre privacidade dos dados

- No plano gratuito do Streamlit Community Cloud, o app roda na
  infraestrutura deles. A URL não é indexada/pública para quem não tem o
  link, mas também não há login por padrão — qualquer pessoa com a URL
  acessa. Se isso for uma preocupação, dá para:
  - Usar a proteção por senha simples do próprio Streamlit Cloud
    (`st.secrets` + verificação de senha no início do `app.py`); ou
  - Avaliar um plano pago com controle de acesso; ou
  - Hospedar em um servidor da própria empresa em vez do Streamlit Cloud.
- Os XMLs enviados e a planilha gerada não ficam salvos em lugar nenhum
  além da sessão do navegador — o app não grava esses arquivos em disco.

## Sobre a configuração de CFOPs excluídos

O arquivo `cfop_config.json` traz uma lista inicial de CFOPs que não geram
parcela (transferências, outras entradas, bonificação etc.). Ela pode ser
editada direto na tela do app, mas:

- **Rodando localmente**: a edição é salva em disco automaticamente.
- **Rodando no Streamlit Cloud**: o servidor pode reiniciar e perder
  alterações salvas só em disco. Use os botões "Baixar configuração atual"
  e "Carregar configuração salva" na barra lateral para não perder o que
  foi ajustado — ou edite o `cfop_config.json` direto no GitHub para
  tornar a mudança permanente para todo mundo que usa o app.
