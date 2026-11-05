
<#import "layout.ftlh" as layout>

<@layout.page
    title="Home"
    activePage="home"
    cssFile="/css/IndexStyle.css">


<!-- page heading -->
<header>
    <h1>Anime Character Gallery</h1>
    <p>Explore characters from some of your favorite anime series.</p>
</header>

<!-- search and category filter -->
<section class="search-box">

    <form action="/" method="GET">

        <input
            type="text"
            name="name"
            placeholder="Search by character name..."
            value="${searchName!}"
        >

        <input
            type="text"
            name="universe"
            placeholder="Filter by anime universe..."
            value="${searchUniverse!}"
        >

        <button type="submit" class="button">
            Search
        </button>

        <a href="/" class="button">
            Clear
        </a>

    </form>

</section>


    <!-- character cards -->
    <section class="character-grid">

        <#list characters as c>

            <article class="card">

                <!-- character image -->
                <#if c.imageUrl?? && c.imageUrl?has_content>
                    <img src="${c.imageUrl}" alt="${c.name}">
                <#else>
                    <img src="/images/placeholder.svg"
                         alt="No image available">
                </#if>

                <div class="card-content">

                    <h2>${c.name}</h2>

                    <p>${c.description}</p>

                    <div class="tag-row">
                        <span>${c.universe!"Unknown universe"}</span>
                        <span>${c.species!"Unknown species"}</span>
                    </div>

                    <a class="button"
                       href="/characters/${c.characterId?c}">
                        View Details
                    </a>

                </div>

            </article>

        <#else>
    <div class="no-results">
        <h2>No characters found</h2>
        <p>Try another name or anime universe.</p>
        <a href="/" class="button">Clear Search</a>
    </div>
    
        </#list>

    </section>

</@layout.page>
