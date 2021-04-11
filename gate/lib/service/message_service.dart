import 'dart:collection';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:tst_msg/domain/message.dart';
import 'package:tst_msg/domain/frame.dart';

const _channelHistoryLimit = 500;

/// Сервис сообщений
@singleton
class MessageService extends Observable<ReplyMessage> {
  final Map<String, Queue<Message>> _cache = <String, Queue<Message>>{};
  Map<String, Message> _titles = {};

  /// Добавить сообщение
  void push(String channel, Message message) {
    _cache.putIfAbsent(channel, () => Queue());
    _cache[channel].add(message);
    _titles[channel] = message;
    notifyListeners(ReplyMessage(channel, message));
  }

  /// Получить историю сообщений в каналеks
  List<Message> getChannelList(String channel) {
    return _cache[channel]
        ?.skip(max(0, (_cache[channel]?.length ?? 0) - _channelHistoryLimit))
        ?.toList();
  }

  /// Список каналов с поледним полученным сообщенияем в каждои канале
  Map<String, Message> get titles {
    return _titles ??= _cache.map<String, Message>(
      (key, queue) => MapEntry(key, queue.last),
    );
  }

  /// Очистить всю историю сообщений
  void clearCache() {
    _cache.clear();
    _titles.clear();
  }
}

class Observable<T> {
  final LinkedList<Observer<T>> _observers = LinkedList();

  bool get hasListeners => _observers.isNotEmpty;

  void addListener(void Function(T data) listener) {
    _observers.add(Observer(listener));
  }

  void removeListener(void Function() listener) {
    for (final Observer entry in _observers) {
      if (entry.proceed == listener) {
        entry.unlink();
        return;
      }
    }
  }

  void notifyListeners(T data) {
    if (hasListeners) {
      for (final Observer<T> entry in _observers) {
        try {
          if (entry.list != null) entry.proceed(data);
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void dispose() => _observers.clear();
}

class Observer<T> extends LinkedListEntry<Observer<T>> {
  Observer(this.proceed);

  final void Function(T data) proceed;
}
