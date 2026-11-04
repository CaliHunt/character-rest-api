
package com.example.characterapi.service;

import com.example.characterapi.entity.TvCharacter;
import com.example.characterapi.repository.CharacterRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class CharacterService {

    private final CharacterRepository characterRepository;

    public CharacterService(CharacterRepository characterRepository) {
        this.characterRepository = characterRepository;
    }

    public List<TvCharacter> getAllCharacters(
        String name, String universe) {

    boolean hasName = name != null && !name.isBlank();
    boolean hasUniverse = universe != null && !universe.isBlank();

    //both filters are being used
    if (hasName && hasUniverse) {
        return characterRepository
                .findByNameContainingIgnoreCaseAndUniverseIgnoreCase(
                        name, universe);
    }

    //only name search
    if (hasName) {
        return characterRepository
                .findByNameContainingIgnoreCase(name);
    }

    //only universe filter
    if (hasUniverse) {
        return characterRepository
                .findByUniverseIgnoreCase(universe);
    }

    //no filters, show everyone
    return characterRepository.findAll();
}

    public TvCharacter getCharacterById(Long id) {
        return characterRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        "Character not found with ID: " + id));
    }

    public TvCharacter addCharacter(TvCharacter character) {
        character.setCharacterId(null);
        return characterRepository.save(character);
    }

    public TvCharacter updateCharacter(
            Long id, TvCharacter updatedCharacter) {

        TvCharacter existingCharacter = getCharacterById(id);

        existingCharacter.setName(updatedCharacter.getName());
        existingCharacter.setDescription(
                updatedCharacter.getDescription());
        existingCharacter.setUniverse(
                updatedCharacter.getUniverse());
        existingCharacter.setSpecies(
                updatedCharacter.getSpecies());
        existingCharacter.setImageUrl(
                updatedCharacter.getImageUrl());

        return characterRepository.save(existingCharacter);
    }

    public void deleteCharacter(Long id) {
        TvCharacter character = getCharacterById(id);
        characterRepository.delete(character);
    }
}
