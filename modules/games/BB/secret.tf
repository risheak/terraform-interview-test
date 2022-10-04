resource "kubernetes_secret" "bee_brilliant_prod_10fede_4223_e0fb_3_d55de_3_d8f_7_e9efc_79" {
  metadata {
    name = "bee-brilliant-prod-10fede4223e0fb3d55de3d8f7e9efc79"
  }

  data = {
    MONGODB_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"

    PERSONALIZED_FEATURES_REDIS_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"

    REDIS_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"

    USER_SEGMENTS_REDIS_URL = "6f15ca39e47e108630e8f1d7dbfbabfb"
  }

  type = "Opaque"
}

