; Duplikat : worst-texture, mean-texture, mean-radius
(defrule tanya-mean-concave-points-eval
=>
    (printout t
        "mean_concave points? "
    )
    (assert(mean-concave-points (read)))
)

(defrule mean-concave-points-eval
    (mean-concave-points ?x)
=>
    (if (<= ?x 0.05)
        then
        (assert (worst-radius))
        (assert (branch-kiri))
        else
        (assert (worst-perimeter))
        (assert (branch-kanan))
    )
)

(defrule tanya-mean-radius
    (mean-radius)
=>
    (printout t "mean_radius? ")
    (assert (mean-radius (read)))
)

(defrule tanya-worst-texture
    (worst-texture)
=>
    (printout t "worst_texture? ")
    (assert (worst-texture (read)))
)

; Branch kiri
(defrule worst-radius-eval
    (worst-radius ?x)
=>
    (if (<= ?x 16.83)
        then
        (assert (radius-error))
        (assert (texture-kiri))
        else
        (assert (mean-texture))
        (assert (texture-kanan))
    )
)

(defrule mean-texture-kanan-eval
    (mean-texture ?x)
    (texture-kanan)
=>
    (if (<= ?x 16.19)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (concave-point-error))
    )
)

(defrule concave-point-error-eval
    (concave-point-error ?x)
=>
    (if (<= ?x 0.01)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule radius-error-eval
    (radius-error ?x)
=>
    (if (<= ?x 0.63)
        then
        (assert (worst-texture))
        else
        (assert (mean-smoothness))
    )
)

(defrule mean-smoothness-eval
    (mean-smoothness ?x)
=>
    (if (<= ?x 0.09)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule worst-texture-kiri-eval
    (worst-texture ?x)
    (branch-kiri)
=>
    (if (<= ?x 30.15)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (worst-area))
    )
)

(defrule worst-area-eval
    (worst-area ?x)
=>
    (if (<= ?x 641.60)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (mean-radius))
    )
)

(defrule mean-radius-kiri-eval
    (mean-radius ?x)
    (branch-kiri)
=>
    (if (<= ?x 13.45)
        then
        (assert (mean-texture))
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule mean-texture-kiri-eval
    (mean-texture ?x)
    (texture-kiri)
=>
    (if (<= ?x 28.79)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule tanya-worst-radius
    (worst-radius)
=>
    (printout t "worst_radius? ")
    (assert(worst-radius (read)))
)

(defrule tanya-radius-error
    (radius-error)
=>
    (printout t "radius_error? ")
    (assert(radius-error (read)))
)

(defrule tanya-mean-texture
    (mean-texture)
=>
    (printout t "mean_texture? ")
    (assert(mean-texture (read)))
)

(defrule tanya-concave-point-error
    (concave-point-error)
=>
    (printout t "concave_point_error? ")
    (assert(concave-point-error (read)))
)

(defrule tanya-mean-smoothness
    (mean-smoothness)
=>
    (printout t "mean_smoothness? ")
    (assert(mean-smoothness (read)))
)

(defrule tanya-worst-area
    (worst-area)
=>
    (printout t "worst_area? ")
    (assert(worst-area (read)))
)

(defrule tanya-worst-texture
    (worst-texture)
=>
    (printout t "worst_texture? ")
    (assert(worst-texture (read)))
)

; Branch kanan
(defrule worst-perimeter-eval
    (worst-perimeter ?x)
=>
    (if (<= ?x 114.45)
        then
        (assert (worst-texture))
        else
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule worst-texture-kanan-eval
    (worst-texture ?x)
    (branch-kanan)
=>
    (if (> ?x 25.65)
        then
        (assert (perimeter-error))
        else
        (assert (worst-concave-points))
    )
)

(defrule worst-concave-points-eval
    (worst-concave-points ?x)
=>
    (if (> ?x 0.17)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule perimeter-error-eval
    (perimeter-error ?x)
=>
    (if (> ?x 1.56)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (mean-radius))
    )
)

(defrule mean-radius-kanan-eval
    (branch-kanan)
    (mean-radius ?x)
=>
    (if (> ?x 13.34)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule tanya-worst-perimeter
    (worst-perimeter)
=>
    (printout t "worst_perimeter? ")
    (assert(worst-perimeter (read)))
)

(defrule tanya-worst-concave-points
    (worst-concave-points)
=>
    (printout t "worst_concave_points? ")
    (assert(worst-concave-points (read)))
)

(defrule tanya-perimeter-error
    (perimeter-error)
=>
    (printout t "perimeter_error? ")
    (assert(perimeter-error (read)))
)
