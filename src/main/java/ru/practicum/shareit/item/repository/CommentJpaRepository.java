package ru.practicum.shareit.item.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import ru.practicum.shareit.item.model.Comment;
import ru.practicum.shareit.item.model.Item;

import java.util.List;

public interface CommentJpaRepository extends JpaRepository<Comment, Long> {
    @EntityGraph(attributePaths ={"item", "author"})
    List<Comment> findByItemIn(List<Item> items);

    @EntityGraph(attributePaths ={"item", "author"})
    List<Comment> findByItem(Item item);
}