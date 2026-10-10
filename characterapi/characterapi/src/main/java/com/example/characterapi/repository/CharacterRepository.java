
package com.example.characterapi.repository;

import com.example.characterapi.entity.TvCharacter;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CharacterRepository
        extends JpaRepository<TvCharacter, Long> {

    List<TvCharacter> findByUniverseIgnoreCase(String universe);

    List<TvCharacter> findByNameContainingIgnoreCase(String name);
}
