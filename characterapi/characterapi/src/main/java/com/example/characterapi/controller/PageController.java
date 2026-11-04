
package com.example.characterapi.controller;

import com.example.characterapi.entity.TvCharacter;
import com.example.characterapi.service.CharacterService;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class PageController {

    private final CharacterService characterService;

    public PageController(CharacterService characterService) {
        this.characterService = characterService;
    }

    // display all characters on the home page
    @GetMapping("/")
    public String home(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String universe,
            Model model) {

        List<TvCharacter> characters =
                characterService.getAllCharacters(name, universe);

        model.addAttribute("characters", characters);

        // preserve search values in the form
        model.addAttribute("searchName", name);
        model.addAttribute("searchUniverse", universe);

        return "index";
    }

    // display one character's details
    @GetMapping("/characters/{id}")
    public String details(@PathVariable Long id, Model model) {

        try {
            TvCharacter character =
                    characterService.getCharacterById(id);

            model.addAttribute("character", character);

            return "details";

        } catch (ResponseStatusException ex) {

            if (ex.getStatusCode() == HttpStatus.NOT_FOUND) {
                model.addAttribute(
                        "errorMessage",
                        "The character you are looking for does not exist."
                );

                return "error";
            }

            throw ex;
        }
    }

    // show the form for adding a character
@GetMapping("/characters/new")
public String newCharacterForm(Model model) {
    model.addAttribute("character", new TvCharacter());
    model.addAttribute("formTitle", "Add New Character");
    model.addAttribute("formAction", "/characters");
    return "character-form";
}

// save the new character
@PostMapping("/characters")
public String addCharacter(
        @ModelAttribute TvCharacter character,
        RedirectAttributes redirectAttributes) {

    characterService.addCharacter(character);

    redirectAttributes.addFlashAttribute(
            "successMessage", "Character added successfully!");

    return "redirect:/";
}

// show the form for editing a character
@GetMapping("/characters/{id}/edit")
public String editCharacterForm(
        @PathVariable Long id,
        Model model) {

    TvCharacter character = characterService.getCharacterById(id);

    model.addAttribute("character", character);
    model.addAttribute("formTitle", "Edit Character");
    model.addAttribute("formAction", "/characters/" + id);

    return "character-form";
}

// save changes to an existing character
@PostMapping("/characters/{id}")
public String updateCharacter(
        @PathVariable Long id,
        @ModelAttribute TvCharacter character,
        RedirectAttributes redirectAttributes) {

    characterService.updateCharacter(id, character);

    redirectAttributes.addFlashAttribute(
            "successMessage", "Character updated successfully!");

    return "redirect:/characters/" + id;
}

// delete a character
@PostMapping("/characters/{id}/delete")
public String deleteCharacter(
        @PathVariable Long id,
        RedirectAttributes redirectAttributes) {

    characterService.deleteCharacter(id);

    redirectAttributes.addFlashAttribute(
            "successMessage", "Character deleted successfully!");

    return "redirect:/";
}

// display the about page
@GetMapping("/about")
public String about() {
    return "about";
}
    
}
