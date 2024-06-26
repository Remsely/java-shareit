package ru.practicum.shareit.item.service;

import ru.practicum.shareit.item.dto.ItemExtraInfoDto;
import ru.practicum.shareit.item.mapper.ItemMapper;
import ru.practicum.shareit.item.model.Comment;
import ru.practicum.shareit.item.model.Item;

import java.util.List;

public interface ItemService {
    Item addItem(Item item, long userId);

    Item updateItem(Item item, long itemId, long userId);

    ItemExtraInfoDto getItem(long id, long userId, ItemMapper itemMapper);

    List<ItemExtraInfoDto> getUserItems(long userId, Integer from, Integer size, ItemMapper itemMapper);

    List<Item> searchItems(long userId, String query, Integer from, Integer size);

    Comment addComment(Comment comment, long itemId, long userId);
}
