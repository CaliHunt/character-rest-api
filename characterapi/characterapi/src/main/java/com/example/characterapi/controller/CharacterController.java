
package com.example.characterapi.controller;

import com.example.characterapi.entity.TvCharacter;
import com.example.characterapi.service.CharacterService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/characters")
public class CharacterController {

    private final CharacterService characterService;

    public CharacterController(CharacterService characterService) {
        this.characterService = characterService;
    }

    @GetMapping
    public List<TvCharacter> getAllCharacters(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String universe) {

        return characterService.getAllCharacters(name, universe);
    }

    @GetMapping("/{id}")
    public TvCharacter getCharacterById(@PathVariable Long id) {
        return characterService.getCharacterById(id);
    }

    @PostMapping
    public ResponseEntity<TvCharacter> addCharacter(
            @Valid @RequestBody TvCharacter character) {

        TvCharacter savedCharacter =
                characterService.addCharacter(character);

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(savedCharacter);
    }

    @PutMapping("/{id}")
    public TvCharacter updateCharacter(
            @PathVariable Long id,
            @Valid @RequestBody TvCharacter character) {

        return characterService.updateCharacter(id, character);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCharacter(
            @PathVariable Long id) {

        characterService.deleteCharacter(id);
        return ResponseEntity.noContent().build();
    }
}
