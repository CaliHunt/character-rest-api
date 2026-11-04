
<#macro page title activePage cssFile>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${title} | Anime Character Gallery</title>

    <link rel="stylesheet" href="${cssFile}">
</head>

<body>

    <!-- shared navigation -->
    <div class="site-header">
        <div class="nav-wrap">

            <a href="/" class="brand">
                Anime<span>Gallery</span>
            </a>

            <nav class="site-nav">
                <a href="/"
                   <#if activePage == "home">class="active"</#if>>
                    Home
                </a>

                <a href="/about"
                   <#if activePage == "about">class="active"</#if>>
                    About
                </a>

                <a href="/characters/new"
                   <#if activePage == "add">class="active"</#if>>
                    Add Character
                </a>
            </nav>

        </div>
    </div>

    <!-- success message appears after successful actions -->
    <#if successMessage??>
        <div class="success-message">
            ${successMessage}
        </div>
    </#if>

    <!-- individual page content goes here -->
    <#nested>

    <!-- shared footer -->
    <footer class="site-footer">
        <p>Anime Character Gallery | CSC 340</p>
    </footer>

</body>
</html>
</#macro>
