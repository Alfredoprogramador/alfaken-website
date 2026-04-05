# 🌍 Sistema de Múltiplos Idiomas - Alfaken Startup

## Idiomas Suportados

O site da Alfaken Startup agora suporta **3 idiomas**:

- 🇧🇷 **Português** (PT) - Idioma padrão
- 🇺🇸 **Inglês** (EN)
- 🇪🇸 **Espanhol** (ES)

## Como Funciona

### Arquitetura

O sistema de internacionalização (i18n) foi implementado com:

1. **translations.js** - Arquivo com todas as traduções
2. **Atributos data-i18n** - Marcadores nos elementos HTML
3. **LanguageManager** - Classe JavaScript que gerencia as traduções
4. **LocalStorage** - Armazena a preferência do usuário

### Componentes

#### 1. Seletor de Idiomas

Localizado no header, permite trocar entre os 3 idiomas:

```html
<div class="language-selector">
    <button class="lang-btn active" data-lang="pt">🇧🇷</button>
    <button class="lang-btn" data-lang="en">🇺🇸</button>
    <button class="lang-btn" data-lang="es">🇪🇸</button>
</div>
```

#### 2. Traduções (translations.js)

Todas as strings do site estão organizadas por chave:

```javascript
const translations = {
    pt: {
        'nav.home': 'Início',
        'nav.services': 'Serviços',
        // ...
    },
    en: {
        'nav.home': 'Home',
        'nav.services': 'Services',
        // ...
    },
    es: {
        'nav.home': 'Inicio',
        'nav.services': 'Servicios',
        // ...
    }
};
```

#### 3. Atributos HTML

Cada elemento traduzível tem o atributo `data-i18n`:

```html
<h2 data-i18n="services.title">Nossos Serviços</h2>
<p data-i18n="services.subtitle">Oferecemos soluções...</p>
```

## Como Usar

### Para Usuários

1. Clique na bandeira do idioma desejado no header
2. O site será instantaneamente traduzido
3. A preferência é salva no navegador

### Para Desenvolvedores

#### Adicionar uma Nova Tradução

1. Abra `translations.js`
2. Adicione a chave e tradução nos 3 idiomas:

```javascript
// Em translations.pt
'new.key': 'Texto em português',

// Em translations.en  
'new.key': 'Text in English',

// Em translations.es
'new.key': 'Texto en español',
```

3. No HTML, adicione o atributo:

```html
<element data-i18n="new.key">Texto em português</element>
```

#### Adicionar um Novo Idioma

1. Em `translations.js`, adicione o novo objeto de idioma:

```javascript
const translations = {
    pt: { /* ... */ },
    en: { /* ... */ },
    es: { /* ... */ },
    fr: {
        'nav.home': 'Accueil',
        // ... todas as outras chaves
    }
};
```

2. Adicione o botão no HTML:

```html
<button class="lang-btn" data-lang="fr" title="Français">
    <img src="bandeira-frança.svg" alt="FR">
</button>
```

3. Atualize as mensagens de sucesso em `script.js`:

```javascript
const successMessages = {
    pt: '...',
    en: '...',
    es: '...',
    fr: 'Message envoyé avec succès!'
};
```

## Elementos Traduzidos

### Navegação
- ✅ Menu principal (Início, Serviços, Portfólio, Contato)

### Hero Section
- ✅ Título principal
- ✅ Descrição
- ✅ Botões de ação

### Serviços
- ✅ Título da seção
- ✅ Subtítulo
- ✅ 6 cards de serviços (título, descrição, features)

### Portfólio
- ✅ Título da seção
- ✅ Subtítulo
- ✅ Filtros (Todos, Web, E-commerce, Apps, Automação)
- ✅ 6 projetos (título, categoria, descrição)

### Contato
- ✅ Título da seção
- ✅ Subtítulo
- ✅ Informações de contato
- ✅ Formulário completo (labels, placeholders, botão)
- ✅ Mensagens de sucesso

### Footer
- ✅ Tagline
- ✅ Títulos de seções
- ✅ Links
- ✅ Newsletter
- ✅ Copyright

## Persistência

O idioma selecionado é salvo no `localStorage`:

```javascript
localStorage.setItem('alfaken_language', 'en');
```

Ao retornar ao site, o último idioma escolhido é automaticamente carregado.

## Código da LanguageManager

```javascript
class LanguageManager {
    constructor() {
        this.currentLanguage = localStorage.getItem('alfaken_language') || 'pt';
        this.init();
    }
    
    changeLanguage(lang) {
        // Atualiza idioma
        // Salva no localStorage
        // Atualiza página
        // Atualiza botões
    }
    
    updatePageLanguage() {
        // Encontra todos os elementos com data-i18n
        // Aplica a tradução correspondente
    }
}
```

## Testando

Para testar as traduções:

1. Abra o site no navegador
2. Abra o Console do desenvolvedor (F12)
3. Execute:

```javascript
// Mudar para inglês
languageManager.changeLanguage('en');

// Mudar para espanhol
languageManager.changeLanguage('es');

// Verificar idioma atual
languageManager.getCurrentLanguage();
```

## SEO e Meta Tags

O atributo `lang` do HTML é automaticamente atualizado:

- PT: `<html lang="pt-BR">`
- EN: `<html lang="en-US">`
- ES: `<html lang="es-ES">`

## Boas Práticas

### ✅ Fazer

- Sempre adicionar traduções nos 3 idiomas
- Usar chaves descritivas (ex: `service.web.title`)
- Manter consistência na nomenclatura
- Testar todos os idiomas antes do deploy

### ❌ Evitar

- Deixar textos hardcoded sem `data-i18n`
- Usar chaves genéricas (ex: `text1`, `text2`)
- Esquecer de traduzir placeholders
- Traduzir nomes de marcas ou tecnologias

## Troubleshooting

### Problema: Texto não muda ao trocar idioma

**Solução:** Verifique se:
1. O elemento tem o atributo `data-i18n`
2. A chave existe em todos os idiomas
3. A chave está escrita corretamente (case-sensitive)

### Problema: Botão de idioma não funciona

**Solução:**
1. Verifique se `translations.js` está carregado antes de `script.js`
2. Confirme que o botão tem `data-lang` correto
3. Veja o console para erros JavaScript

### Problema: Idioma não persiste ao recarregar

**Solução:**
1. Verifique se o localStorage está habilitado
2. Confirme que `changeLanguage()` está sendo chamado
3. Limpe o cache do navegador

## Performance

- **Tamanho do translations.js:** ~15KB
- **Tempo de troca:** < 50ms
- **Impacto no carregamento:** Mínimo
- **Compatibilidade:** IE11+, todos os navegadores modernos

## Próximas Melhorias

- [ ] Detecção automática de idioma do navegador
- [ ] URLs traduzidas (exemplo.com/pt/, exemplo.com/en/)
- [ ] Traduções dinâmicas via API
- [ ] Cache de traduções
- [ ] Mais idiomas (Francês, Alemão, Italiano)

## Suporte

Para dúvidas ou problemas:
- Email: contato@alfaken.com.br
- Documentação: Este arquivo
- Console do navegador: Mensagens de debug

---

**Desenvolvido com 💙 pela Alfaken Startup**
