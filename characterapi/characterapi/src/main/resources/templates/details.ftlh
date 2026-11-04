
<#import "layout.ftlh" as layout>

<@layout.page
    title=character.name
    activePage="home"
    cssFile="/css/DetailsStyle.css">

    <header class="page-hero">
        <p class="kicker">CHARACTER PROFILE</p>
        <h1>${character.name}</h1>
        <p>Learn more about this anime character.</p>
    </header>

    <main>

        <div class="details-layout">

            <!-- character portrait -->
            <div class="details-portrait">

                <#if character.imageUrl?? && character.imageUrl?has_content>
                    <img src="${character.imageUrl}"
                         alt="${character.name}">
                <#else>
                    <img src="/images/placeholder.svg"
                         alt="No image available">
                </#if>

            </div>

            <!-- character information -->
            <div class="details-body">

                <section>
                    <h2>Overview</h2>

                    <ul class="stat-list">

                        <li>
                            <span>Name</span>
                            <span>${character.name}</span>
                        </li>

                        <li>
                            <span>Anime Universe</span>
                            <span>${character.universe!"Unknown"}</span>
                        </li>

                        <li>
                            <span>Species</span>
                            <span>${character.species!"Unknown"}</span>
                        </li>

                    </ul>
                </section>

                <section>
                    <h2>Description</h2>
                    <p>${character.description}</p>
                </section>

                <div class="submit-row">
    <a href="/" class="button">Back to Gallery</a>

    <a href="/characters/${character.characterId?c}/edit"
       class="button">Edit Character</a>

    <form action="/characters/${character.characterId?c}/delete"
          method="POST"
          onsubmit="return confirm('Are you sure you want to delete this character?');">
        <button type="submit" class="button">Delete Character</button>
    </form>
</div>

            </div>

        </div>

    </main>

</@layout.page>
