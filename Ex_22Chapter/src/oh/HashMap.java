package oh;

public class HashMap<K, V> {

    private static final int TABLE_SIZE = 128;
    private HashEntry<K, V>[] table;

    public HashMap() {
        table = new HashEntry[TABLE_SIZE];
    }
    //stick coffee
    public V get(K key) {
    	// 95
        final int hashIndex = getHashIndex(key);
        final HashEntry<K, V> entry = table[hashIndex];
        return entry.getValue();
    }

    public void put(K key, V value) {
    	// 95
        final int hashIndex = getHashIndex(key);
        final HashEntry<K, V> entry = new HashEntry<>(key, value);
        table[hashIndex] = entry;
    }

    private int getHashIndex(K key) {
    	// sc1.hashCode = 1081127135
    	// sc2.hashCode = 1081127135
    	// sc3.hashCode = 1081127135 
        return Math.abs(key.hashCode()) % TABLE_SIZE;
    }

    private static class HashEntry<K, V> {
        private final K key;
        private final V value;

        public HashEntry(K key, V value) {
            this.key = key;
            this.value = value;
        }

        public K getKey() {
            return key;
        }

        public V getValue() {
            return value;
        }
    }
}
