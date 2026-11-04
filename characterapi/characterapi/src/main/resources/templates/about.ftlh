<#import "layout.ftlh" as layout>

<@layout.page
    title="About"
    activePage="about"
    cssFile="/css/AboutStyle.css">

    <header class="page-hero">
        <p class="kicker">ABOUT THIS PROJECT</p>
        <h1>Anime Character Gallery</h1>
        <p>A place to explore characters from popular anime universes.</p>
    </header>

    <main class="about-layout">

        <section>
            <h2>About the Gallery</h2>

            <p>
                Welcome to the Anime Character Gallery! This website
                provides a collection of characters from different
                anime series. Visitors can explore character profiles,
                search by name, and filter characters by their anime
                universe.
            </p>
        </section>

        <section>
            <h2>What You Can Do</h2>

            <ul>
                <li>Browse anime characters in the gallery.</li>
                <li>View individual character profiles.</li>
                <li>Search for characters by name.</li>
                <li>Filter characters by anime universe.</li>
                <li>Add new characters to the collection.</li>
                <li>Edit or delete existing characters.</li>
            </ul>
        </section>

        <section>
            <h2>How It Works</h2>

            <p>
                This application uses Spring Boot, Java, FreeMarker,
                and PostgreSQL. Character information is stored in
                a database and displayed dynamically through the
                website.
            </p>
        </section>

    </main>

</@layout.page> 