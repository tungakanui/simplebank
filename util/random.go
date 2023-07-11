package util

import (
	"math/rand"
	"time"
)

func init() {
	rand.Seed(time.Now().UnixNano())
}

func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

func RandomOwner() string {
	adjectives := []string{
		"Happy", "Silly", "Lucky", "Brave", "Gentle", "Clever",
		"Kind", "Wise", "Funny", "Crazy", "Charming", "Daring",
	}
	nouns := []string{
		"Elephant", "Monkey", "Tiger", "Penguin", "Kangaroo", "Lion",
		"Dolphin", "Owl", "Giraffe", "Zebra", "Panda", "Koala",
	}

	adj := adjectives[rand.Intn(len(adjectives))]
	noun := nouns[rand.Intn(len(nouns))]
	return adj + " " + noun
}


func RandomMoney() int64 {
    return RandomInt(0, 1000)
}

func RandomCurrency() string {
    currencies := []string{"EUR", "USD", "CAD"}
    n := len(currencies)
    return currencies[rand.Intn(n)]
}
