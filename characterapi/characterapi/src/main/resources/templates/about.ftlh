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

        <img src="/images/Naruto.jpg"
     alt="Anime character featured in the gallery"
     class="about-image">

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
    <h2>How This Application Works</h2>

    <p>
        This application uses a layered Spring Boot architecture.
        The Page Controller handles browser requests and sends
        information to FreeMarker templates. The templates create
        the pages that visitors see.
    </p>

    <p>
        The Service layer contains the application's character
        operations, while the Repository layer communicates with
        the PostgreSQL database. The Entity layer represents
        character records stored in that database.
    </p>

    <p>
        The front end uses FreeMarker to display character
        information retrieved through the service layer. When a
        visitor adds, edits, or deletes a character, the page
        controller calls the service, which updates the database.
        The REST API remains available separately through the
        API controller.
    </p>
</section>

    </main>

</@layout.page> 