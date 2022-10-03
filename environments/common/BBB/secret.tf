resource "kubernetes_secret" "bee_brilliant_blast_prod_059fe_33725_e86526a_824_d8bd_23_bd_6986" {
  metadata {
    name = "bee-brilliant-blast-prod-059fe33725e86526a824d8bd23bd6986"
  }

  data = {
    MONGODB_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"

    PERSONALIZED_FEATURES_REDIS_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"

    REDIS_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"

    USER_SEGMENTS_REDIS_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"
  }

  type = "Opaque"
}

