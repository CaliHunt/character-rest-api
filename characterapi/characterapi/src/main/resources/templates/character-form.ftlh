<#import "layout.ftlh" as layout>

<@layout.page title="Add Character"
              activePage="add"
              cssFile="/css/NewCharacterStyle.css">

<section class="form-card">
    <h1>${formTitle!"Character Form"}</h1>

    <form action="${formAction!'/characters'}" method="POST">

        <div class="field">
            <label for="name">Character Name</label>
            <input type="text" id="name" name="name"
                   value="${(character.name)!}" required>
        </div>

        <div class="field">
            <label for="description">Description</label>
            <textarea id="description" name="description"
                      rows="4" required>${(character.description)!}</textarea>
        </div>

        <div class="field">
            <label for="universe">Anime Universe</label>
            <input type="text" id="universe" name="universe"
                   value="${(character.universe)!}" required>
        </div>

        <div class="field">
            <label for="species">Species</label>
            <input type="text" id="species" name="species"
                   value="${(character.species)!}" required>
        </div>

        <div class="field">
            <label for="imageUrl">Image URL</label>
            <input type="text" id="imageUrl" name="imageUrl"
                   value="${(character.imageUrl)!}"
                   placeholder="/images/Naruto.jpg">
        </div>

        <div class="submit-row">
            <button type="submit" class="button">Save Character</button>
            <a href="/" class="button">Cancel</a>
        </div>

    </form>
</section>

</@layout.page>